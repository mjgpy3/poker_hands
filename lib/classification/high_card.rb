module PokerHands
  module Classification
    class HighCard
      def initialize(card)
        @card = card
      end

      def to_s
        "High Card: #{@card}"
      end
    end
  end
end
