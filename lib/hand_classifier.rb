class HandClassifier

  def initialize(to_classify)
    @hand = to_classify
  end

  def classify
    p pairs
    p threes
    p fours

    return ::Classification::FullHouse.new if [pairs.size, threes.size] == [1, 1]
    return ::Classification::Flush.new if @hand.group_by(&:suite).size == 1
    return ::Classification::Pair.new if pairs.size == 1
    return ::Classification::TwoPair.new if pairs.size == 2
    return ::Classification::ThreeOfAKind.new if threes.any?
    return ::Classification::FourOfAKind.new if fours.any?

    ::Classification::HighCard.new
  end

  private

  def pairs
    @pairs ||= value_to_card_groupings.
      select { |_, cards| cards.size == 2 }.
      keys
  end

  def threes
    @threes ||= value_to_card_groupings.
      select { |_, cards| cards.size == 3 }.
      keys
  end

  def fours
    @fours ||= value_to_card_groupings.
      select { |_, cards| cards.size == 4 }.
      keys
  end

  def value_to_card_groupings
    @groupings ||= @hand.group_by(&:value)
  end

end
