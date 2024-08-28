class AdventureGame
  def initialize
    @current_room = :forest
  end

  def play
    puts "Welcome to the Adventure Game!"
    loop do
      puts "You are in the #{@current_room}. What do you do?"
      action = gets.chomp.downcase
      case @current_room
      when :forest
        if action == "go north"
          @current_room = :castle
        elsif action == "go east"
          @current_room = :river
        else
          puts "Invalid action."
        end
      when :castle
        if action == "go south"
          @current_room = :forest
        else
          puts "Invalid action."
        end
      when :river
        if action == "go west"
          @current_room = :forest
        else
          puts "Invalid action."
        end
      end
    end
  end
end

AdventureGame.new.play
