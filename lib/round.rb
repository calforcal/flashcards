class Round
  attr_accessor :turns, :deck, :new_turn, :number_correct, :counter
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, self.current_card)
    @turns << new_turn
    move_to_back = @deck.cards.shift(1)
    @deck.cards.push(move_to_back)
    new_turn
  end

  def correct?
    if @turns.last.card.answer.downcase == @turns.last.guess
      true
    else
      false
    end
  end

  def number_correct
    counter = 0
    @turns.each {|turn| counter += 1 if turn.card.answer.downcase == turn.guess.downcase}
    return counter
  end

  def number_correct_by_category(category)
    counter = 0
    @turns.each {|turn| counter += 1 if turn.card.category == category && turn.card.answer.downcase == turn.guess.downcase}
    return counter
  end

  def percent_correct
    percent = (self.number_correct.to_f / @turns.count.to_f) * 100
  end

  def turns_by_category(category)
    counter = 0
    @turns.each {|turn| counter += 1 if turn.card.category == category}
    return counter
  end

  def percent_correct_by_category(category)
    percent = (self.number_correct_by_category(category).to_f / self.turns_by_category(category).to_f) * 100
  end

  def start
    puts "Welcome! You're playing with #{self.deck.cards.count} cards."
    puts "-------------------------------------------------"
    card_count = 1
    while card_count <= self.deck.cards.count
      puts "This is card number #{card_count} out of #{self.deck.cards.count}."
      puts "Question: #{self.deck.cards.first.question}"
      answer = gets.chomp.downcase
      turn = take_turn(answer)
      puts turn.feedback
      card_count += 1
    end

    puts "****** Game over! ******"
    puts "You had #{self.number_correct} correct guesses out of #{@turns.count} for a total score of #{self.percent_correct}%"
    categories = []
    deck.cards.flatten.each {|card| categories << card.category}
    unique_categories = categories.uniq
    unique_categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
  end
end