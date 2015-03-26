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

  def initialize(to_classify)
    @hand = to_classify
  end

  def classify
    if straight? && flush?
      Classification::StraightFlush.new(@hand)
    # TODO: Generally more explicit names (e.g. `four_of_a_kind`)
    elsif fours.any?
      Classification::FourOfAKind.new(fours.first.value)
    elsif [pairs.count, threes.count] == [1, 1]
      Classification::FullHouse.new(pairs.first, threes.first)
    elsif flush?
      Classification::Flush.new(@hand.first.suite)
    elsif straight?
      Classification::Straight.new(@hand)
    elsif threes.any?
      Classification::ThreeOfAKind.new(threes.first)
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
    # TODO: In general prefer `count`
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
    Array(values_grouped_where { |cards| cards.size == 4 }.first)
  end

  def values_grouped_where
    @hand.
      group_by(&:value).
      select { |_, cards| yield(cards) }.
      values
  end
end
