class NumberGuessingGame
  def initialize
    @number = rand(1..100)
    @attempts = 5
  end

  def play
    puts "Guess the number between 1 and 100"
    while @attempts > 0
      print "You have #{@attempts} attempts left. Enter your guess: "
      guess = gets.to_i
      if guess == @number
        puts "Congratulations! You guessed the number!"
        break
      elsif guess > @number
        puts "Too high!"
      else
        puts "Too low!"
      end
      @attempts -= 1
    end
    puts "The number was #{@number}" if @attempts == 0
  end
end

NumberGuessingGame.new.play
