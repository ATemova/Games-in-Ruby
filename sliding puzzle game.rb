class SlidingPuzzle
  def initialize
    @board = (1..15).to_a << nil
    @board.shuffle!
  end

  def play
    loop do
      display_board
      puts "Enter the number to move:"
      number = gets.to_i
      if move_tile(number)
        if solved?
          puts "Congratulations, you solved the puzzle!"
          break
        end
      else
        puts "Invalid move."
      end
    end
  end

  def move_tile(number)
    index = @board.index(number)
    return false unless index

    row, col = index.divmod(4)
    empty_row, empty_col = @board.index(nil).divmod(4)

    if (row - empty_row).abs + (col - empty_col).abs == 1
      @board[index], @board[@board.index(nil)] = nil, number
      true
    else
      false
    end
  end

  def display_board
    @board.each_slice(4) { |row| puts row.map { |el| el.nil? ? ' ' : el.to_s }.join(' ') }
  end

  def solved?
    @board == (1..15).to_a << nil
  end
end

SlidingPuzzle.new.play
