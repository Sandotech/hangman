require_relative 'hangman'

class Game

  def self.play
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

  private

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
    selection = select_game(games)
    play_previous_game(games[selection])
  end

  def self.select_game(games)
    selection = gets.chomp
    until selection.to_i.between?(1, games.size)
      puts "Choose a valid game number"
      selection = gets.chomp
    end
    selection.to_i - 1
  end

  def self.play_previous_game(game)
    game_to_resume = read_previous_game(game)
    resume_game(game_to_resume)
  end

  def self.read_previous_game(game)
    serialized_game = File.binread("GAMES/#{game}")
    game = Marshal.load(serialized_game)
  end

  def self.resume_game(game)
    puts "Welcome back, #{game.game}"
    game.play
  end

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

Game.play