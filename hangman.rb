class Hangman
  def initialize
    @word = ["ruby", "java", "python"].sample
    @guesses = []
    @attempts = 6
  end

  def play
    puts "Welcome to Hangman!"
    while @attempts > 0
      display_word
      print "Guess a letter: "
      guess = gets.chomp
      if @word.include?(guess)
        @guesses << guess
      else
        @attempts -= 1
        puts "Incorrect! #{@attempts} attempts left."
      end
      if won?
        puts "You won! The word was #{@word}."
        break
      end
    end
    puts "Game over! The word was #{@word}." if @attempts == 0
  end

  def display_word
    puts @word.chars.map { |char| @guesses.include?(char) ? char : "_" }.join(" ")
  end

  def won?
    @word.chars.all? { |char| @guesses.include?(char) }
  end
end

Hangman.new.play
