class Card
  attr_reader :value, :suite

  def initialize(value, suite)
    @value, @suite = value, suite
  end
end
