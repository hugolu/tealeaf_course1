### Write down the application logical
# 1. Welcome message: Play Paper Rock Scissors!
# 2. Player turn: Choose one: (P/R/S)
# 3. Computer turn: pick P/R/S randomly
# 4. Show the picks: You picked P/R/S and computer picked P/R/S.
# 5. Check the result: Paper beats Rock!
#    with rules: a tie (if both are the same), or p > r, r > s, s > p
# 6. Who is the winner: You/Computer won!
# 7. Go to 2 if player would like to play again

### OOP
# 1. extract mojor nouns -> classes
# 2. extract mojor verbs -> instance methodes
# 3. group instance methods into classes

class Hand
  include Comparable

  attr_reader :value

  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissor'}

  def initialize(value)
    @value = value
  end

  def to_s
    CHOICES[value]
  end

  def <=>(other)
    if value == other.value
      0
    elsif (value == 'p' && other.value == 'r') ||
          (value == 'r' && other.value == 's') ||
          (value == 's' && other.value == 'p')
      1
    else
      -1
    end
  end
end

class Player
  attr_reader :name, :hand

  def initialize(name)
    @name = name
  end

end

class Human < Player
  def initialize(name)
    super name
  end

  def pick_hand
    begin
      puts "Choose one: (P/R/S)"
      pick = gets.chomp.downcase
    end until Hand::CHOICES.keys.include?(pick)
    @hand = Hand.new(pick)
  end
end

class Computer < Player
  def initialize(name)
    super name
  end

  def pick_hand
    @hand = Hand.new(Hand::CHOICES.keys.sample)
  end
end

class Game
  attr_reader :player, :computer

  def initialize
    @player = Human.new("hugo")
    @computer = Computer.new("r2d2")
    puts "Play Paper Rock Scissors!"
  end

  def show_winner(hand)
    if hand.value == 'p'
      puts "Paper beats Rock!"
    elsif hand.value == 'r' 
      puts "Rock beats Scissors!"
    else
      puts "Scissors beats Paper!"
    end
  end

  def check_result
    puts "Player picks #{player.hand} and Computer picks #{computer.hand}"
    if player.hand == computer.hand
      puts "A tie."
    elsif player.hand > computer.hand
      show_winner(player.hand)
      puts "Player won!"
    else
      show_winner(computer.hand)
      puts "Computer won!"
    end
  end

  def play_again?
    loop do
      puts "Play again? (Y/N)"
      ans = gets.chomp.downcase
      return true if ans == 'y'
      return false if ans == 'n'
    end
  end

  def play
    loop do
      player.pick_hand
      computer.pick_hand
      check_result
      exit if play_again? == false
    end
  end
end

game = Game.new
game.play
