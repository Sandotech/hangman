require_relative 'hangman'

class Game

  # def initialize(hangman = Hangman::new)
  #   @hangman = hangman
  #   # @hangman.play
  # end

  def self.welcome
    puts "Hi, would you like to load a previous game or start a new one?"
    puts "Type 1 to load a previous game"
    puts "Type 2 to start a new game"
    select_mode
  end

  def self.select_mode
    mode = chose_mode(gets.chomp)
    case mode
    when "1"
      load_previous_game
    when "2"
      start_new_game
    else
      puts "Invalid selection, please try again"
    end
  end

  def self.chose_mode(selection)
    until selection == "1" || selection == "2"
      puts "Choose 1 or 2"
      selection = gets.chomp
    end
    selection
  end

  def self.start_new_game
    hangman = Hangman::new
    hangman.play
  end

  def self.load_previous_game
    games = load_games
    show_games(games)
  end

  def select_game

  end

  private

  def self.load_games
    games = Dir.children('GAMES').select { |file| file.include?('_data.marshal') }
  end

  def self.show_games(games)
    puts "Previous Games:"
    puts "--------------"
    puts "Choose the game number to load"
    games.map.with_index do |game, index|
      puts "#{index += 1}) #{game}"
    end
  end
end

game = Game.welcome