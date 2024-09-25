# frozen_string_literal: true

# Hangman game class
class Hangman
  TURN_LIMIT = 9

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

      print 'Enter a letter: '
      guess = gets.chomp.downcase

      if word.include?(guess)

      end
    end
  end

  def print_game
    puts "You have to enter a letter and guess the right worrd"
  end

  private

  def hide_word(word)
    word.split("").inject(String.new) { |string, val| string += "_" }
  end

  def select_word
    words = File.read('google-10000-english-no-swears.txt')
    words.split.select { |word| word.size.between? 5, 12 }.sample
  end
end

game = Hangman.new
p game.actual_guess
