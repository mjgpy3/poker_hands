module Classification
  class FourOfAKind
    def initialize(value)
      @value = value
    end

    def to_s
      "Four of a Kind: #{@value.to_s.capitalize}"
    end
  end
end
