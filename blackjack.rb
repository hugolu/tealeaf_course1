# [Ref]
#   http://en.wikipedia.org/wiki/Standard_52-card_deck
#   http://en.wikipedia.org/wiki/Blackjack

# [Pseudo code]
#   1. have a set of poker cards (52 cards)
#   2. deal the initial 2 cards

def have_new_cards
  cards = []
  suits = ["♣", "♦", "♥", "♠"]
  ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
  suits.each do |suit|
    ranks.each do |rank|
      cards << [suit, rank]
    end
  end
  return cards
end

def deal_a_card(cards)
  cards.delete(cards.sample)
end

def show_cards(cards)
  cards.each do |(suit, rank)|
    print "#{suit}#{rank}, "
  end
end

def calc_sum(cards)
  sum = 0
  aces = 0
  cards.each do |(_, rank)|
    case rank
    when 'A'
      sum += 11
      aces += 1
    when 'J','Q','K'
      sum += 10
    else
      sum += rank.to_i
    end
  end

  while sum > 21 && aces > 0
    sum -= 10
    aces -= 1
  end
  puts "sum: #{sum}"
  return sum
end

def player_choice(cards)
  loop do
    puts "Hit or Stay (h, s):"
    ans = gets.chomp.downcase
    case ans
    when 's'
      return nil
    when 'h'
      return deal_a_card(cards)
    end
  end
end

def play_again?
  loop do
    puts "play again?"
    ans = gets.chomp.downcase
    return true if ans == 'y'
    return false if ans == 'n'
  end
end

loop do
  # 0. welcome
  puts "Welcome to Black Jack"

  # 1. init the poker cards
  cards = have_new_cards
  player_cards = []
  dealer_cards = []

  player_sum = 0
  dealer_sum = 0

  # 2. deal a card to player and dealer
  player_cards << deal_a_card(cards)
  show_cards(player_cards)
  player_sum = calc_sum(player_cards)

  dealer_cards << deal_a_card(cards)
  show_cards(dealer_cards)
  dealer_sum = calc_sum(dealer_cards)

  # 3. the player goes first and can choose to either "hit" or "stay" 
  until player_sum >= 21
    card = player_choice(cards)
    if card == nil
      break
    end
    player_cards << card
    show_cards(player_cards)
    player_sum = calc_sum(player_cards)
  end

  # 4. the dealer must hit until she has at least 17
  until dealer_sum >= 21
    if dealer_sum >= 17 and dealer_sum > player_sum
      break
    end
    dealer_cards << deal_a_card(cards)
    show_cards(dealer_cards)
    dealer_sum = calc_sum(dealer_cards)
  end

  # 5. play again?
  exit if play_again? == false
end
