# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  if (hand - VALID_CARDS != [])
    raise ArgumentError.new("This hand contains invalid cards")
  end

  values_hand = royalty_to_value(hand)
  value = values_hand.sum

  if (values_hand.include?(11) && value > 21)
    i = 0
    while( value > 21 && i < values_hand.count(11))
      value -= 10
      i += 1
    end
  end

  if(value > 21)
    raise ArgumentError.new("Value is over 21, you lose")
  end

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

