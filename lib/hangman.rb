# frozen_string_literal: true

# Hangman class
class Hangman

  attr_reader :actual_guess, :game

  def initialize
    @word = select_word
    @actual_guess = hide_word @word
    @USED_CHARACTERS = []
    @turn = 9
    @game = set_game
  end

  def play
    until @turn.zero? || won?
      puts "Turns left: #{@turn}"
      puts "Current state: #{@actual_guess}"

      guess = try_guess

      save && break if guess == 'SAVE'

      indexes = obtain_matched_indexes(guess)
      replace_underscore(guess, indexes) if indexes.any?

      declare_won && break if won?

      @turn -= 1 if indexes.empty?
    end

    puts "You lost. The word was: #{@word}" if @turn == 0
  end

  def try_guess
    puts 'Enter a letter:                         NOTE: Write SAVE save the current game'
    guess = gets.chomp.downcase
    return 'SAVE' if guess.downcase == 'save'
    return valid_character?(guess) ? save_character(guess) : try_guess
  end

  private

  def set_game
    puts "Please introduce the name to save the game"
    gets.chomp.upcase
  end

  def print_game
    puts @actual_guess
  end

  def won?
    @actual_guess.eql? @word
  end

  def declare_won
    puts "Congratulations, you won!"
    puts "This is the word: #{@word}"
  end

  def replace_underscore(character, indexes)
    indexes.each { |index| @actual_guess[index] = character }
  end

  def obtain_matched_indexes(character)
    word_array = @word.split("")
    word_array.each_index.with_object([]) { |index, arr| arr << index if word_array[index] == character }
  end

  def valid_character?(character)
    valid_length?(character) && character_used?(character)
  end

  def valid_length?(character)
    nil_character?(character) && character.size == 1
  end

  def nil_character?(character)
    !character.nil?
  end

  def hide_word(word)
    word.split("").inject(String.new) { |string, val| string += "_" }
  end

  def save_character(character)
    @USED_CHARACTERS << character
    character
  end

  def character_used?(character)
    !@USED_CHARACTERS.include? character
  end

  def select_word
    words = File.read('google-10000-english-no-swears.txt')
    words.split.select { |word| word.size.between? 5, 12 }.sample
  end

  def save
    data_to_save = Marshal.dump(self)

    File.open("GAMES/#{@game}_data.marshal", 'wb') { |file| file.write(data_to_save) }
  end
end
