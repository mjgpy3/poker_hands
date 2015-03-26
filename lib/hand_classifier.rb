require './lib/classification/high_card.rb'

class HandClassifier

  def initialize(to_classify)
    @hand = to_classify
  end

  def classify
    value_clusters = @hand.group_by(&:value)

    return ::Classification::Pair.new if value_clusters.size == 4

    ::Classification::HighCard.new
  end

end
