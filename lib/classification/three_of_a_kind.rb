module Classification
  class ThreeOfAKind
    def initialize(cards)
      @cards = cards
    end

    def to_s
      value = @cards.first.value.to_s.capitalize
      "Three of a Kind: #{value} (#{suits})"
    end

    private

    def value
      @cards.
        first.
        value.
        to_s.
        capitalize
    end

    def suits
      @cards.map { |card| card.suit.to_s.capitalize }.join(', ')
    end
  end
end
