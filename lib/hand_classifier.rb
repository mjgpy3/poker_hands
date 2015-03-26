class HandClassifier

  def initialize(to_classify)
    @hand = to_classify
  end

  def classify
    return ::Classification::StraightFlush.new(@hand) if straight? && flush?
    return ::Classification::FourOfAKind.new(fours.first.first.value) if fours.any?
    return ::Classification::FullHouse.new(pairs.first, threes.first) if [pairs.size, threes.size] == [1, 1]
    return ::Classification::Flush.new(@hand.first.suite) if flush?
    return ::Classification::Straight.new(@hand) if straight?
    return ::Classification::ThreeOfAKind.new(threes.first) if threes.any?
    return ::Classification::TwoPair.new(pairs) if pairs.size == 2
    return ::Classification::Pair.new(pairs.first) if pairs.size == 1

    ::Classification::HighCard.new(@hand.max_by(&:to_i))
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
