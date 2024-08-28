class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, '-') }
    @player = 'X'
  end

  def play
    loop do
      display_board
      puts "Player #{@player}, enter your move (row and column): "
      row, col = gets.split.map(&:to_i)
      if valid_move?(row, col)
        @board[row][col] = @player
        if winner?
          display_board
          puts "Player #{@player} wins!"
          break
        end
        switch_player
      else
        puts "Invalid move. Try again."
      end
    end
  end

  def display_board
    @board.each { |row| puts row.join(' ') }
  end

  def valid_move?(row, col)
    row.between?(0, 2) && col.between?(0, 2) && @board[row][col] == '-'
  end

  def winner?
    [@board, @board.transpose, diagonals].any? do |lines|
      lines.any? { |line| line.uniq.length == 1 && line.first != '-' }
    end
  end

  def diagonals
    [@board.each_index.map { |i| @board[i][i] }, @board.each_index.map { |i| @board[i][-i-1] }]
  end

  def switch_player
    @player = @player == 'X' ? 'O' : 'X'
  end
end

TicTacToe.new.play
