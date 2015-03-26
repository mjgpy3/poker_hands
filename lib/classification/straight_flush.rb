require 'classification/straight'

module Classification
  class StraightFlush < Straight
    def to_s
      "Straight Flush: #{through_statement}"
    end
  end
end
