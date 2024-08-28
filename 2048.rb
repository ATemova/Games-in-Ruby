class Game2048
  def initialize
    @board = Array.new(4) { Array.new(4, 0) }
    add_new_tile
    add_new_tile
  end

  def play
    loop do
      display_board
      move = get_input
      if move_board(move)
        add_new_tile
        if game_over?
          puts "Game Over!"
          display_board
          break
        end
      end
    end
  end

  def get_input
    puts "Enter move (w/a/s/d): "
    gets.chomp
  end

  def move_board(direction)
    # Implement logic for moving tiles in the given direction
    # Return true if the board was changed
    # For simplicity, only placeholder logic is provided
    case direction
    when 'w'
      move_up
    when 'a'
      move_left
    when 's'
      move_down
    when 'd'
      move_right
    else
      puts "Invalid move. Try again."
      return false
    end
    true
  end

  def move_up
    # Implement moving tiles up
  end

  def move_left
    # Implement moving tiles left
  end

  def move_down
    # Implement moving tiles down
  end

  def move_right
    # Implement moving tiles right
  end

  def add_new_tile
    empty_cells = @board.flatten.each_index.select { |i| @board.flatten[i] == 0 }
    index = empty_cells.sample
    @board.flatten[index] = [2, 4].sample
  end

  def display_board
    @board.each { |row| puts row.join(' ') }
  end

  def game_over?
    @board.flatten.none?(&:zero?)
  end
end

Game2048.new.play
