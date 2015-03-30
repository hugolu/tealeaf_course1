
def user_choose
  loop do
    puts "Choose one: (P/R/S)"
    answer = gets.chomp.upcase
    case answer
    when 'P'
      return 'Paper'
    when 'R'
      return 'Rock'
    when 'S'
      return 'Scissors'
    end
  end
end

def computer_choose
  answer = Random.rand(3)
  case answer
  when 0
    return 'Paper'
  when 1
    return 'Rock'
  when 2
    return 'Scissors'
  end
end

def judge(choice1, choice2)
  if choice1 == 'Paper'
    case choice2
    when 'Rock'
      puts 'Paper wraps Rock'
      return 1
    when 'Scissors'
      puts 'Scissors cut Paper'
      return -1
    else
      return 0
    end
  end

  if choice1 == 'Rock'
    case choice2
    when 'Scissors'
      puts 'Rock blunts Scissors'
      return 1
    when 'Paper'
      puts 'Paper wraps Rock'
      return -1
    else
      return 0
    end
  end

  if choice1 == 'Scissors'
    case choice2
    when 'Paper'
      puts 'Scissors cut Paper'
      return 1
    when 'Rock'
      puts 'Rock blunts Scissors'
      return -1
    else
      return 0
    end
  end
end


puts "Play Paper Rock Scissors!"

loop do
  your_choice = user_choose
  computer_choice = computer_choose
  puts "Your picked #{your_choice} and computer picked #{computer_choice}."

  result = judge(your_choice, computer_choice)
  if result > 0
    puts "You won!"
  elsif result < 0
    puts "Computer won!"
  else
    puts "It's a tie."
  end

  puts "Play again?(Y/N)"
  ans = gets.chomp.upcase
  if ans != 'Y'
    break
  end
end
