class Maze
  def initialize(width, height)
    @width, @height = width, height
    @maze = Array.new(height) { Array.new(width, '#') }
    carve_passage(0, 0)
  end

  def carve_passage(x, y)
    directions = [[1, 0], [0, 1], [-1, 0], [0, -1]].shuffle
    directions.each do |dx, dy|
      nx, ny = x + dx * 2, y + dy * 2
      if nx.between?(0, @width - 1) && ny.between?(0, @height - 1) && @maze[ny][nx] == '#'
        @maze[ny - dy][nx - dx] = ' '
        @maze[ny][nx] = ' '
        carve_passage(nx, ny)
      end
    end
  end

  def display
    @maze.each { |row| puts row.join }
  end
end

maze = Maze.new(21, 11)
maze.display
