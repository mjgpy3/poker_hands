module Classification
  class Flush
    def initialize(suit)
      @suit = suit
    end

    def to_s
      "Flush: #{@suit.to_s.capitalize}"
    end
  end
end
