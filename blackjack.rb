# [Ref]
#   http://en.wikipedia.org/wiki/Standard_52-card_deck
#   http://en.wikipedia.org/wiki/Blackjack

# [Pseudo code]
#   1. have a set of poker cards (52 cards)
#   2. deal the initial 2 cards

def have_new_cards
  cards = []
  suits = ["♣", "♦", "♥", "♠"]
  suits.each do |suit|
    (1..13).each do |rank|
      cards << [suit, rank]
    end
  end
  return cards
end

def deal_a_card(cards)
  cards.delete(cards.sample)
end

def show_cards(cards)
  cards.each do |(suit,rank)|
    print "#{suit}"
    case rank
    when 1
      print "A"
    when 2..10
      print "#{rank}"
    when 11
      print "J"
    when 12
      print "Q"
    when 13
      print "K"
    end
    print " "
  end
end

def calc_sum(cards)
  sum = 0
  cards.each do |(suit, rank)|
    sum += rank
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
until player_sum > 21
  card = player_choice(cards)
  if card == nil
    break
  end
  player_cards << card
  show_cards(player_cards)
  p player_sum = calc_sum(player_cards)
end

# 4. the dealer must hit until she has at least 17
until dealer_sum > 21
  if dealer_sum >= 17 and dealer_sum > player_sum
    break
  end
  dealer_cards << deal_a_card(cards)
  show_cards(dealer_cards)

  p dealer_sum = calc_sum(dealer_cards)
end

