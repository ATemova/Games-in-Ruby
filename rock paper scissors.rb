class RockPaperScissors
  OPTIONS = ['rock', 'paper', 'scissors']

  def play
    loop do
      puts "Choose rock, paper, or scissors:"
      player_choice = gets.chomp.downcase
      computer_choice = OPTIONS.sample
      puts "Computer chose #{computer_choice}"
      if player_choice == computer_choice
        puts "It's a tie!"
      elsif win?(player_choice, computer_choice)
        puts "You win!"
      else
        puts "You lose!"
      end
      puts "Play again? (yes/no)"
      break if gets.chomp.downcase == 'no'
    end
  end

  def win?(player, computer)
    (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
  end
end

RockPaperScissors.new.play
