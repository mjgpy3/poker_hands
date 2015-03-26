module Classification
  class Flush
    def initialize(suite)
      @suite = suite
    end

    def to_s
      "Flush: #{@suite.to_s.capitalize}"
    end
  end
end
