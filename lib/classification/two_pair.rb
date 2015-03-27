module PokerHands
  module Classification
    class TwoPair
      def initialize(pair_of_pairs)
        @first_pair = pair_of_pairs.first
        @second_pair = pair_of_pairs.last
      end

      def to_s
        "Two Pair: #{@first_pair.first} and #{@first_pair.last};" + 
          " #{@second_pair.first} and #{@second_pair.last}"
      end
    end
  end
end
