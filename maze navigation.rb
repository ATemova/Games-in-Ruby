class Maze
  def initialize
    @maze = [
      ['S', '.', '.', '.', 'E'],
      ['#', '#', '.', '#', '.'],
      '.', '.', '.', '#', '.'],
      ['.', '#', '.', '.', '.']
    ]
    @position = [0, 0]
  end

  def play
    until won?
      display_maze
      puts "Move (w/a/s/d):"
      move = gets.chomp
      make_move(move)
    end
    puts "Congratulations, you've escaped the maze!"
  end

  def display_maze
    @maze.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        if [i, j] == @position
          print 'P '
        else
          print "#{cell} "
        end
      end
      puts
    end
  end

  def make_move(direction)
    x, y = @position
    case direction
    when 'w'
      x -= 1 if x > 0
    when 'a'
      y -= 1 if y > 0
    when 's'
      x += 1 if x < @maze.size - 1
    when 'd'
      y += 1 if y < @maze[0].size - 1
    else
      puts "Invalid move."
      return
    end

    if @maze[x][y] != '#'
      @position = [x, y]
    else
      puts "Blocked by a wall."
    end
  end

  def won?
    @maze[@position[0]][@position[1]] == 'E'
  end
end

Maze.new.play
