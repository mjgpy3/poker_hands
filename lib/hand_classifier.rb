class HandClassifier

  def initialize(to_classify)
    @hand = to_classify
  end

  def classify
    p pairs
    p threes
    p fours

    return ::Classification::FourOfAKind.new if fours.any?
    return ::Classification::FullHouse.new if [pairs.size, threes.size] == [1, 1]
    return ::Classification::Flush.new if flush?
    return ::Classification::Straight.new if straight?

    return ::Classification::ThreeOfAKind.new if threes.any?
    return ::Classification::TwoPair.new if pairs.size == 2
    return ::Classification::Pair.new if pairs.size == 1
    ::Classification::HighCard.new
  end

  private

  def flush?
    @hand.group_by(&:suite).size == 1 
  end

  def straight?
    sorted = @hand.map(&:to_i).sort

    sorted == [2, 3, 4, 5, 14] ||
      sorted == Array(sorted.first..sorted.last)
  end

  def pairs
    values_grouped_where { |cards| cards.size == 2 }
  end

  def threes
    values_grouped_where { |cards| cards.size == 3 }
  end

  def fours
    values_grouped_where { |cards| cards.size == 4 }
  end

  def values_grouped_where
    @hand.
      group_by(&:value).
      select { |_, cards| yield(cards) }.
      values
  end
end
