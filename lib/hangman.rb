# frozen_string_literal: true

# Hangman game class
class Hangman
  TURN_LIMIT = 9
  USED_CHARACTERS = []

  attr_reader :actual_guess

  def initialize
    @word = select_word
    @actual_guess = hide_word @word
  end

  def play
    turns_left = TURN_LIMIT

    until turns_left.zero? || won?
      puts "Turns left: #{turns_left}"
      puts "Current state: #{@actual_guess}"

      guess = try_guess

      indexes = obtain_matched_indexes(guess)
      replace_underscore(guess, indexes) if indexes.any?

      declare_won && break if won?

      turns_left -= 1 if indexes.empty?
    end

    puts "You lost. The word was: #{@word}" unless won?
  end

  def try_guess
    print 'Enter a letter: '
    guess = gets.chomp.downcase
    return valid_character?(guess) ? save_character(guess) : try_guess
  end

  def print_game
    puts @actual_guess
  end

  private

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
    USED_CHARACTERS << character
    character
  end

  def character_used?(character)
    !USED_CHARACTERS.include? character
  end

  def select_word
    words = File.read('google-10000-english-no-swears.txt')
    words.split.select { |word| word.size.between? 5, 12 }.sample
  end
end

game = Hangman.new
game.play