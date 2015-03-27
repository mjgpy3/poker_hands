module PokerHands
  class Card
    attr_reader :value, :suit

    SPECIAL_VALUES = {
      ace: 14,
      jack: 11,
      queen: 12,
      king: 13
    }.freeze

    def initialize(value, suit)
      @value, @suit = value, suit
    end

    def to_s
      "#{value.to_s.capitalize} of #{suit.to_s.capitalize}"
    end

    def to_i
      SPECIAL_VALUES.fetch(@value, @value)
    end
  end
end
