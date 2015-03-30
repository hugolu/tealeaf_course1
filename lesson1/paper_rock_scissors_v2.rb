# pseudo code
# 1. get the player's choice
# 2. the the computer's choice
# 3. compare both: paper > rock, rock > scissors, scissors > paper, a tie
# 4. play again?

CHOICES = {'p' => 'paper', 'r' => 'rock', 's' => 'scissors'}

begin
  # player's choice
  begin
    puts "Pick one: (p, r, s)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer's choice
  computer_choice = CHOICES.keys.sample

  puts "You picked #{CHOICES[player_choice]}, and computer picked #{CHOICES[computer_choice]}."

  # compare both
  if player_choice == computer_choice
    puts "It's a tie."
  elsif (player_choice == 'p' && computer_choice == 'r') ||
        (player_choice == 'r' && computer_choice == 's') ||
        (player_choice == 's' && computer_choice == 'p')
    puts "You won!"
  else
    puts "Computer won!"
  end

  # again?
  puts "\nPlay again? (y/n)"
  again = gets.chomp.downcase
end while again == 'y'
