require "./lib/card"

class CardGenerator
  attr_accessor :filename, :final_deck

  def initialize(filename)
    @filename = filename
    @final_deck
  end

  def cards
    file_data = File.read(filename).split
    clean_data = []
    file_data.each {|line| line.delete ","}

    while file_data.count > 1
      clean_data << file_data.shift(3)
    end

    final_deck = clean_data.map do |card|
      Card.new(card[0], card[1], card[2])
    end
    return final_deck
  end
end