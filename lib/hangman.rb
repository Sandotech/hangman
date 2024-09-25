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
    hidden_word = hide_word(word)

    until turns_left.zero? || hidden_word == word
      puts "Turns left: #{turns_left}"
      puts "Current state: #{hidden_word}"

      guess = try_guess

      if word.include?(guess)
        puts 'true'
      end
    end
  end

  def try_guess
    print 'Enter a letter: '
    guess = gets.chomp.downcase
    return valid_character?(guess) ? save_character(guess) : try_guess
  end

  def print_game
    puts "You have to enter a letter and guess the right worrd"
  end

  private

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
