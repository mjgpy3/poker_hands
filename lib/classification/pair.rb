module Classification
  class Pair
    def initialize(pair)
      @pair = pair
    end

    def to_s
      "Pair: #{@pair.first} and #{@pair.last}"
    end
  end
end
