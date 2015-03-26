require 'classification/flush.rb'
require 'classification/four_of_a_kind.rb'
require 'classification/full_house.rb'
require 'classification/high_card.rb'
require 'classification/pair.rb'
require 'classification/straight_flush.rb'
require 'classification/straight.rb'
require 'classification/three_of_a_kind.rb'
require 'classification/two_pair.rb'

class HandClassifier
  ACE_FIRST_STRAIGHT_VALUES = [2, 3, 4, 5, 14].freeze

  def initialize(to_classify)
    @hand = to_classify
  end

  def classify
    if straight? && flush?
      Classification::StraightFlush.new(@hand)
    elsif four_of_a_kind.any?
      Classification::FourOfAKind.new(four_of_a_kind.first.value)
    elsif [pairs.count, three_of_a_kind.count] == [1, 1]
      Classification::FullHouse.new(pairs.first, three_of_a_kind.first)
    elsif flush?
      Classification::Flush.new(@hand.first.suit)
    elsif straight?
      Classification::Straight.new(@hand)
    elsif three_of_a_kind.any?
      Classification::ThreeOfAKind.new(three_of_a_kind.first)
    elsif pairs.count == 2
      Classification::TwoPair.new(pairs)
    elsif pairs.count == 1
      Classification::Pair.new(pairs.first)
    else
      Classification::HighCard.new(@hand.max_by(&:to_i))
    end
  end

  private

  def flush?
    Set.new(@hand.map(&:suit)).count == 1
  end

  def straight?
    sorted = @hand.map(&:to_i).sort

    sorted == ACE_FIRST_STRAIGHT_VALUES ||
      sorted == Array(sorted.first..sorted.last)
  end

  def pairs
    values_grouped_where { |cards| cards.count == 2 }
  end

  def three_of_a_kind
    values_grouped_where { |cards| cards.count == 3 }
  end

  def four_of_a_kind
    Array(values_grouped_where { |cards| cards.count == 4 }.first)
  end

  def values_grouped_where
    @hand.
      group_by(&:value).
      select { |_, cards| yield(cards) }.
      values
  end
end
