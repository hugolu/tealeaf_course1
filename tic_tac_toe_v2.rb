# use hash to handle the board

board = {}

def init_board(b)
  (1..9).each {|i| b[i] = ' '}
end

def draw_board(b)
  system 'clear'
  puts "#{b[1]}|#{b[2]}|#{b[3]}"
  puts "-----"
  puts "#{b[4]}|#{b[5]}|#{b[6]}"
  puts "-----"
  puts "#{b[7]}|#{b[8]}|#{b[9]}"
  puts
end

def user_pick(b)
  begin
    puts "Please pick a square (1-9):"
    choice = gets.chomp.to_i
  end until b[choice] == ' '
  b[choice] = 'O'
end

def computer_pick(b)
  choice = b.keys.select{|k| b[k] == ' '}.sample
  b[choice] = 'X'
end

def game_finish?(b)
  b.values.count(' ') == 0
end

WINNER_LINES =[[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,6], [3,6,9], [1,5,9], [3,5,7]]
def check_winner(board)
  WINNER_LINES.each do |line|
    return 'Player' if board.values_at(*line).count('O') == 3
    return 'Computer' if board.values_at(*line).count('X') == 3
  end
  nil
end

init_board(board)
draw_board(board)
begin
  user_pick(board)
  draw_board(board)
  break if winner = check_winner(board)
  computer_pick(board)
  draw_board(board)
  break if winner = check_winner(board)
end until game_finish?(board)

if winner
  puts "#{winner} won!"
else
  puts "A tie."
end
