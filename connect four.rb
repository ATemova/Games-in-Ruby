class ConnectFour
  def initialize
    @board = Array.new(6) { Array.new(7, '-') }
    @current_player = 'X'
  end

  def play
    loop do
      display_board
      puts "Player #{@current_player}, choose a column (0-6):"
      col = gets.to_i
      if drop_disc(col)
        if winner?
          display_board
          puts "Player #{@current_player} wins!"
          break
        end
        switch_player
      else
        puts "Column full or invalid."
      end
    end
  end

  def drop_disc(col)
    row = @board.rindex { |r| r[col] == '-' }
    if row
      @board[row][col] = @current_player
      true
    else
      false
    end
  end

  def winner?
    # Check rows, columns, and diagonals for a win
    directions = [[1, 0], [0, 1], [1, 1], [1, -1]]
    @board.each_with_index do |row, r|
      row.each_with_index do |cell, c|
        next if cell == '-'
        directions.each do |dr, dc|
          if (0..3).all? { |i| @board[r + i * dr][c + i * dc] == cell }
            return true
          end
        end
      end
    end
    false
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def display_board
    @board.each { |row| puts row.join(' ') }
  end
end

ConnectFour.new.play
