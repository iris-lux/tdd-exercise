# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  raise ArgumentError.new("Error: Hand is nil") if hand.nil?
  raise ArgumentError.new("Error: Hand is empty") if hand.length == 0
  raise ArgumentError.new("Error: This hand contains more than 5 cards") if hand.length > 5
  raise ArgumentError.new("Error: This hand contains invalid cards") if hand - VALID_CARDS != []

  values_hand = royalty_to_value(hand)
  value = values_hand.sum

  if (values_hand.include?(11) && value > 21)
    i = 0
    while( value > 21 && i < values_hand.count(11))
      value -= 10
      i += 1
    end
  end

  raise ArgumentError.new("Error: Value is over 21, value should remain under 21") if value > 21

  return value
end

def royalty_to_value (hand)

  return hand.map do |card|
    if(card == 'Ace')
      11
    elsif(%w[Jack Queen King].include?(card))
      10
    else
      card
    end

  end
end

