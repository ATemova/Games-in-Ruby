class ZombieSurvival
  def initialize
    @health = 100
    @zombies = 10
  end

  def play
    loop do
      puts "Your health: #{@health}"
      puts "Zombies left: #{@zombies}"
      puts "Fight (f) or Run (r)?"
      action = gets.chomp
      case action
      when 'f'
        @zombies -= 1
        @health -= 10
        puts "You fought a zombie!"
      when 'r'
        @health -= 5
        puts "You ran away!"
      else
        puts "Invalid action."
      end
      if @health <= 0
        puts "You died!"
        break
      elsif @zombies <= 0
        puts "You survived!"
        break
      end
    end
  end
end

ZombieSurvival.new.play
