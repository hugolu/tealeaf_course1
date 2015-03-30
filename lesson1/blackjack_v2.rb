def cards_to_s(cards)
  str = ""
  cards.each do |(suit, rank)|
    str += "#{suit}#{rank}, "
  end
  str
end

def calc_total(cards)
  total = 0
  aces = 0
  cards.each do |(suit, rank)|
    case rank
    when 'A'
      total += 11
      aces += 1
    when 'J','Q','K'
      total += 10
    else
      total += rank.to_i
    end
  end

  #correct for Aces
  aces.times do
    total -= 10 if total > 21
  end

  total
end

# Interactive command line blackjack game
puts "Welcome to Blackjack!"

# create a deck
suits = ["♣", "♦", "♥", "♠"]
ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
deck = suits.product(ranks)
deck.shuffle!

# arrays to hold cards of player and dealer
player_cards = []
dealer_cards = []

# deal cards to player and dealer
player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

player_total = calc_total(player_cards)
dealer_total = calc_total(dealer_cards)

# show cards
puts "Player has #{cards_to_s(player_cards)} for a total of #{player_total}"
puts "Dealer has #{cards_to_s(dealer_cards)} for a total of #{dealer_total}"
puts ""

# player turn
while player_total < 21
  puts "What would you like to do? (H)it, (S)tay"
  hit_or_stay = gets.chomp.downcase

  if hit_or_stay == 'h'
    # hit
  elsif hit_or_stay == 's'
    break
  else
    next
  end

  player_cards << deck.pop
  player_total = calc_total(player_cards)
  puts "Player has #{cards_to_s(player_cards)} for a total of #{player_total}"

  if player_total == 21
    puts "Congratulations, you hit blackjack! You win!"
    exit
  elsif player_total > 21
    puts "Sorry, it looks like you busted!"
    exit
  end
end

# Dealer turn
if dealer_total == 21
  puts "Sorry, dealer hit blackjack. You lose."
  exit
end

while dealer_total < 17
  dealer_cards << deck.pop
  dealer_total = calc_total(dealer_cards)
  puts "Dealer has #{cards_to_s(dealer_cards)} for a total of #{dealer_total}"

  if dealer_total == 21
    puts "Sorry, dealer hit blackjack. You lose."
    exit
  elsif dealer_total > 21
    puts "Congratulations, dealer busted! You win!"
    exit
  end
end

# compare hands
if player_total > dealer_total
  puts "Congratulations, you win!"
elsif player_total < dealer_total
  puts "Sorry, dealer wins."
else
  puts "A tie."
end
