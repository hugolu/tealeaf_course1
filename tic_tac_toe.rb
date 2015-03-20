# pseudo code
#   1. display the game
#   2. player enter => check if player won or finished
#   3. computer enter => check if computer won or finished
#   4. go to 2

b = Array.new(9, ' ')
WIN = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def show_board(b)
  system "clear"
  puts " #{b[0]} | #{b[1]} | #{b[2]}"
  puts "---+---+---"
  puts " #{b[3]} | #{b[4]} | #{b[5]}"
  puts "---+---+---"
  puts " #{b[6]} | #{b[7]} | #{b[8]}"
  puts
end

def player_choice(b)
  begin
    puts "Pick a square (1-9):"
    choice = gets.chomp.to_i - 1
  end until b[choice] == ' '
  b[choice] = 'O'
end

def computer_choice(b)
  begin
    choice = Random.rand(9)
  end until b[choice] == ' '
  b[choice] = 'X'
end

def winner?(b)
  winner = nil
  WIN.each do |w|
    choice = b[w[0]]
    if choice == ' '
      next
    end
    if choice == b[w[1]] && choice == b[w[2]]
      winner = choice == 'O' ? "Player" : "Computer"
      break
    end
  end

  puts "#{winner} won!" if winner != nil
  return winner
end

def finished?(b)
  return true if winner?(b) != nil
  if b.select{|e| e == ' '}.size == 0
    puts "A tie."
    return true
  end
end

show_board(b)

loop do
  player_choice(b)
  show_board(b)
  break if finished?(b)

  computer_choice(b)
  show_board(b)
  break if finished?(b)
end
