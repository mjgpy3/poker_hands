module Classification
  class ThreeOfAKind
    def initialize(cards)
      @cards = cards
    end

    def to_s
      value = @cards.first.value.to_s.capitalize
      "Three of a Kind: #{value} (#{suites})"
    end

    private

    def value
      @cards.
        first.
        value.
        to_s.
        capitalize
    end

    def suites
      @cards.map { |card| card.suite.to_s.capitalize }.join(', ')
    end
  end
end
