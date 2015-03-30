class Square
  attr_reader :value

  def initialize
    @value = ' '
  end

  def to_s
    @value
  end

  def empty?
    @value == ' '
  end

  def mark(marker)
    @value = marker
  end

  def marked?(marker)
    @value == marker
  end
end

class Board
  attr_reader :data

  WINNER_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @data = {}
    (1..9).each do |n|
      data[n] = Square.new
    end
  end

  def draw
    system 'clear'
    puts "#{data[1]}|#{data[2]}|#{data[3]}"
    puts "-+-+-"
    puts "#{data[4]}|#{data[5]}|#{data[6]}"
    puts "-+-+-"
    puts "#{data[7]}|#{data[8]}|#{data[9]}"
    puts ""
  end

  def empty_position
    @data.select {|_,square| square.empty? }.keys
  end

  def has_no_empty_squares?
    empty_position.count == 0
  end

  def mark_square(position, marker)
    @data[position].mark(marker)
  end

  def marker_in_a_row?(marker)
    WINNER_LINES.each do |line|
      return true if @data[line[0]].marked?(marker) && @data[line[1]].marked?(marker) && @data[line[2]].marked?(marker)
    end
    false
  end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Game
  attr_reader :board, :player, :computer, :current_player, :winner

  def initialize
    @player = Player.new('Hugo', 'O')
    @computer = Player.new('R2D2', 'X')
    @board = Board.new
    @current_player = @player
    board.draw
  end

  def current_player_mark_square
    if @current_player == @player
      begin
        puts "Choose a position (1-9) to place a piece:"
        position = gets.chomp.to_i
      end until board.empty_position.include?(position)
    else
      position = board.empty_position.sample
    end

    board.mark_square(position, @current_player.marker)
  end

  def current_player_is_winner?
    board.marker_in_a_row?(@current_player.marker)
  end

  def alternate_player
    if @current_player == @player
      @current_player = @computer
    else
      @current_player = @player
    end
  end

  def play
    loop do
      current_player_mark_square
      board.draw
      if current_player_is_winner?
        puts "#{@current_player.name} won!"
        break
      elsif board.has_no_empty_squares?
        puts "A tie."
        break
      else
        alternate_player
      end
    end
  end
end

game = Game.new
game.play
