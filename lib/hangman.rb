class Hangman
  attr_reader :word
  def initialize
    @word = select_word
  end

  private

  def select_word
    words = File.read("google-10000-english-no-swears.txt")
    words.split.select { |word| word.size.between? 5, 12}.sample
  end
end

game = Hangman.new
p game.word