class SnakeGame
  def initialize
    @board = Array.new(10) { Array.new(10, ' ') }
    @snake = [[5, 5]]
    @direction = [0, 1]
    @food = [rand(10), rand(10)]
  end

  def play
    loop do
      move_snake
      display_board
      handle_input
      if game_over?
        puts "Game Over!"
        break
      end
    end
  end

  def move_snake
    new_head = [@snake.first[0] + @direction[0], @snake.first[1] + @direction[1]]
    if new_head == @food
      @snake.unshift(new_head)
      place_food
    else
      @snake.pop
      @snake.unshift(new_head)
    end
  end

  def place_food
    @food = [rand(10), rand(10)]
  end

  def display_board
    system("clear")
    @board.each { |row| row.fill(' ') }
    @snake.each { |part| @board[part[0]][part[1]] = 'O' }
    @board[@food[0]][@food[1]] = 'X'
    @board.each { |row| puts row.join }
  end

  def handle_input
    input = gets.chomp
    case input
    when 'w' then @direction = [-1, 0]
    when 'a' then @direction = [0, -1]
    when 's' then @direction = [1, 0]
    when 'd' then @direction = [0, 1]
    end
  end

  def game_over?
    head = @snake.first
    head[0].negative? || head[0] >= 10 || head[1].negative? || head[1] >= 10 || @snake[1..].include?(head)
  end
end

SnakeGame.new.play
