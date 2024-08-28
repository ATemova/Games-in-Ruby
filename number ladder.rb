class NumberLadder
  def initialize(start = 1, end_num = 10)
    @current = start
    @end_num = end_num
  end

  def play
    puts "Welcome to the Number Ladder Game!"
    until @current > @end_num
      puts "Current number: #{@current}"
      puts "Choose an operation (add 1 or multiply by 2):"
      operation = gets.chomp
      case operation
      when 'add 1'
        @current += 1
      when 'multiply by 2'
        @current *= 2
      else
        puts "Invalid operation. Try again."
      end
      if @current > @end_num
        puts "You've reached or exceeded the target number #{@end_num}!"
        break
      end
    end
  end
end

NumberLadder.new.play
