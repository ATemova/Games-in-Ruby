class TextAdventure
  def initialize
    @location = "forest"
  end

  def play
    puts "Welcome to the Text Adventure Game!"
    loop do
      puts "You are in the #{@location}. What would you like to do?"
      action = gets.chomp.downcase
      case @location
      when "forest"
        if action == "explore"
          @location = "cave"
          puts "You enter a dark cave."
        elsif action == "leave"
          puts "You leave the forest and the game ends."
          break
        else
          puts "Invalid action."
        end
      when "cave"
        if action == "explore"
          puts "You find a hidden treasure and win the game!"
          break
        elsif action == "leave"
          @location = "forest"
          puts "You return to the forest."
        else
          puts "Invalid action."
        end
      end
    end
  end
end

TextAdventure.new.play
