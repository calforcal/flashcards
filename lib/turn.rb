class Turn
  attr_accessor :card, :answer, :guess
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.downcase == @card.answer.downcase
  end

  def feedback
    if self.correct? == true then return "Correct!" else return "Incorrect." end
  end
end