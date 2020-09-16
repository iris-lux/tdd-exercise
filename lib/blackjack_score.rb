# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  #how do we translate roaylty into 10s?
  # how do we determine the value of Aces?
  # write three argument errors -
  values_hand = royalty_to_value(hand)
  value = values_hand.sum

  if (values_hand.include?(11) && value > 21)
    i = 0
    while( value > 21 && i < values_hand.count(11))
      value -= 10
      i += 1
    end
  end
    #Exception here

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

