### Write down the application logical
# 1. Welcome message: Play Paper Rock Scissors!
# 2. Player turn: Choose one: (P/R/S)
# 3. Computer turn: pick P/R/S randomly
# 4. Show the picks: You picked P/R/S and computer picked P/R/S.
# 5. Check the result: Paper beats Rock!
# 6. Who is the winner: You/Computer won!
# 7. Go to 2 if player would like to play again

### OOP
# 1. extract mojor nouns -> classes
# 2. extract mojor verbs -> instance methodes
# 3. group instance methods into classes


class Paper
 def to_s
  "Paper"
 end

 def compare(other)
   return 0 if other.class == Paper
   return 1 if other.class == Rock
   return -1 if other.class == Scissors
 end
end 

class Rock
  def to_s
    "Rock"
  end

  def compare(other)
    return 0 if other.class == Rock
    return 1 if other.class == Scissors
    return -1 if other.class == Paper
  end
end

class Scissors
  def to_s
    "Scissor"
  end

  def compare(other)
    return 0 if other.class == Scissors
    return 1 if other.class == Paper
    return -1 if other.class == Rock
  end
end

class Player
  def pick(weapons)
    begin
      puts "Choose one: (P/R/S)"
      pick = gets.chomp.upcase
      weapon = weapons[pick]
    end until weapon
    weapon
  end
end

class Computer
  def pick(weapons)
    weapons.to_a.sample[1]
  end
end

class Game
  def initialize
    @player = Player.new
    @computer = Computer.new
    puts "Play Paper Rock Scissors!"
  end

  def check_result(player_pick, computer_pick)
    result = player_pick.compare(computer_pick)
    case result
    when 0
      puts "A tie."
    when 1
      puts "Player won!"
    when -1
      puts "Computer won!"
    end
  end

  def play_again?
    loop do
      puts "Play again? (Y/N)"
      ans = gets.chomp.upcase
      return true if ans == 'Y'
      return false if ans == 'N'
    end
  end

  def run
    weapons = {'P' => Paper.new, 'R' => Rock.new, 'S' => Scissors.new}
    loop do
      player_pick = @player.pick(weapons)
      computer_pick = @computer.pick(weapons)
      puts "You picked #{player_pick} and computer picked #{computer_pick}"
      check_result(player_pick, computer_pick)
      exit if !play_again?
    end
  end
end

Game.new.run
