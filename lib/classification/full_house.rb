module PokerHands
  module Classification
    class FullHouse
      def initialize(pair, threes)
        @pair, @threes = pair, threes
      end

      def to_s
        "Full House: three #{capitalize_first_value(@threes)}s and two #{capitalize_first_value(@pair)}s"
      end

      private

      def capitalize_first_value(set)
        set.
          first.
          value.
          to_s.
          capitalize
      end
    end
  end
end
