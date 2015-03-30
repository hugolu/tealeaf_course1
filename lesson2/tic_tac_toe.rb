### write down the application logic
# 1. show board
# 2. player choose a square: Choose a position (1-9) to place a piece:
# 3. stop if player wins
# 4. computer choose a square
# 5. stop if computer wins
# 6. goto 2 if squares are available

### Rules of Tic-Tac-Toe
# 1. use nine squares [1..9] to record choices of player and computer
# 2. a line is linked if [1,2,3], [4,5,6], [7,8,9] or
#                        [1,4,7], [2,5,8], [3,6,9] or
#                        [1,5,9], [3,5,7] is chosen by the same player

### OOP of Tic-Tac-Toe
# 1. extract nouns for classes
# 2. extract verbs for instance methods
# 3. group instance method into a class

class Board
  attr_reader :squares

  WINNER_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  
  def initialize
    @squares = {}
    (1..9).each do |n|
      @squares[n] = ' '
    end
  end
  
  def display
    system 'clear'
    puts "#{squares[1]}|#{squares[2]}|#{squares[3]}"
    puts "-+-+-"
    puts "#{squares[4]}|#{squares[5]}|#{squares[6]}"
    puts "-+-+-"
    puts "#{squares[7]}|#{squares[8]}|#{squares[9]}"
    puts ""
  end

  def place(position, choice)
    @squares[position] = choice if @squares[position] == ' '
  end

  def empty_squares
    @squares.keys.select {|k| @squares[k] == ' '}
  end

  def make_a_line(choice)
    WINNER_LINES.each do |line|
      return true if squares.select {|k,_| line.include?(k) }.values.count(choice) == 3
    end
    false
  end

end

class Role
  attr_reader :name, :piece

  def win?(board)
    board.make_a_line(piece)
  end
end

class Player < Role
  def initialize
    @name = "Player"
    @piece = 'O'
  end

  def place_piece(board)
    empties = board.empty_squares
    begin
      puts "Choose a position (1-9) to place a piece:"
      position = gets.chomp.to_i
    end until empties.include?(position)
    board.place(position, piece)
  end
end

class Computer < Role
  def initialize
    @name = "Computer"
    @piece = 'X'
  end

  def place_piece(board)
    position = board.empty_squares.sample
    board.place(position, piece)
  end
end

class Game
  attr_reader :player, :computer

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def play
    board = Board.new
    board.display
    winner = nil

    while board.empty_squares
      player.place_piece(board)
      board.display
      if player.win?(board)
        winner = player
        break
      end
      
      computer.place_piece(board)
      board.display
      if computer.win?(board)
        winner = computer
        break
      end
    end

    if winner == player
      puts "Player won!"
    elsif winner == computer
      puts "Computer won!"
    else
      puts "A tie."
    end
  end

end


game = Game.new
game.play
