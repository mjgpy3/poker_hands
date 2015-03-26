class Card
  attr_reader :value, :suite

  def initialize(value, suite)
    @value, @suite = value, suite
  end

  def to_s
    "#{value.to_s.capitalize} of #{suite.to_s.capitalize}"
  end
end
