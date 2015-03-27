module PokerHands
  module Classification
    class Straight
      def initialize(cards)
        @cards = cards.sort_by(&:to_i)
      end

      def to_s
        "Straight: #{through_statement}"
      end

      protected

      def through_statement
        if @cards.first.value == 2 && @cards.last.value == :ace
          return "#{@cards.last} through #{@cards[-2]}"
        end

        "#{@cards.first} through #{@cards.last}"
      end
    end
  end
end
