def show_cards(cards)
  cards.each do |(suit, rank)|
    print "#{suit}#{rank}, "
  end
end

def calc_total(cards)
  0
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
print "Player has "
show_cards(player_cards)
puts "total = #{player_total}"

print "Dealer has "
show_cards(dealer_cards)
puts "total = #{dealer_total}"
