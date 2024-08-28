class Roulette
  def initialize
    @wheel = (0..36).to_a
  end

  def play
    puts "Place your bet (number between 0 and 36):"
    bet = gets.to_i
    result = @wheel.sample
    puts "The wheel landed on #{result}"
    if bet == result
      puts "Congratulations, you win!"
    else
      puts "Sorry, you lose."
    end
  end
end

Roulette.new.play
