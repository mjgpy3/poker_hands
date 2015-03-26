class Card
  attr_reader :value, :suite

  SPECIAL_VALUES = {
    ace: 14,
    jack: 11,
    queen: 12,
    king: 13
  }.freeze

  def initialize(value, suite)
    @value, @suite = value, suite
  end

  def to_s
    "#{value.to_s.capitalize} of #{suite.to_s.capitalize}"
  end

  def to_i
    SPECIAL_VALUES.fetch(@value, @value)
  end
end
