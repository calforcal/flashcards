require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"
require "./lib/card_generator"

cards = CardGenerator.new("./cards.txt").cards

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("Which abolitionist freed over 300 slaves on the Underground Railroad?", "Harriet Tubman", :History)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

round.start