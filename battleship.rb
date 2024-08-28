class Battleship
  def initialize
    @board = Array.new(5) { Array.new(5, '.') }
    @ship = [rand(5), rand(5)]
    @attempts = 0
  end

  def play
    puts "Welcome to Battleship!"
    loop do
      display_board
      puts "Enter row and column (0-4):"
      row, col = gets.split.map(&:to_i)
      if valid_guess?(row, col)
        @attempts += 1
        if [row, col] == @ship
          puts "Hit! You sunk the ship in #{@attempts} attempts."
          break
        else
          @board[row][col] = 'X'
          puts "Miss!"
        end
      else
        puts "Invalid input. Try again."
      end
    end
  end

  def display_board
    @board.each { |row| puts row.join(' ') }
  end

  def valid_guess?(row, col)
    row.between?(0, 4) && col.between?(0, 4)
  end
end

Battleship.new.play
