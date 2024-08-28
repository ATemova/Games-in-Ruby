class CardGame
  def initialize
    @deck = (1..13).to_a * 4
    @player_hand = []
    @dealer_hand = []
    2.times { @player_hand << @deck.delete_at(rand(@deck.size)) }
    2.times { @dealer_hand << @deck.delete_at(rand(@deck.size)) }
  end

  def play
    puts "Your hand: #{@player_hand.inspect}"
    puts "Dealer's hand: #{@dealer_hand.first}"
    puts "Total: #{hand_total(@player_hand)}"
    while hand_total(@player_hand) < 21
      puts "Hit (h) or Stand (s)?"
      action = gets.chomp
      if action == 'h'
        @player_hand << @deck.delete_at(rand(@deck.size))
        puts "Your hand: #{@player_hand.inspect}"
      else
        break
      end
    end
    dealer_turn
    determine_winner
  end

  def dealer_turn
    while hand_total(@dealer_hand) < 17
      @dealer_hand << @deck.delete_at(rand(@deck.size))
    end
    puts "Dealer's hand: #{@dealer_hand.inspect}"
  end

  def hand_total(hand)
    total = hand.reduce(0) do |sum, card|
      sum + (card > 10 ? 10 : card)
    end
    hand.count(1).times { total += 10 if total <= 11 }
    total
  end

  def determine_winner
    player_total = hand_total(@player_hand)
    dealer_total = hand_total(@dealer_hand)
    if player_total > 21
      puts "You busted! Dealer wins."
    elsif dealer_total > 21 || player_total > dealer_total
      puts "You win!"
    elsif player_total < dealer_total
      puts "Dealer wins."
    else
      puts "It's a tie!"
    end
  end
end

CardGame.new.play
