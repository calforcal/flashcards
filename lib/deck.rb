class Deck
  attr_reader :cards, :spec_cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    spec_cards = @cards.select {|card| card.category == category}
  end
end