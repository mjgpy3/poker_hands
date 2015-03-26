require './spec/spec_helper.rb'
require './lib/hand_classifier.rb'
require './lib/card.rb'
require './lib/classification/high_card.rb'
require './lib/classification/pair.rb'
require './lib/classification/two_pair.rb'
require './lib/classification/three_of_a_kind.rb'
require './lib/classification/four_of_a_kind.rb'
require './lib/classification/flush.rb'
require './lib/classification/full_house.rb'
require './lib/classification/straight.rb'

describe HandClassifier do
  let(:classifier) { HandClassifier.new(to_classify) }

  describe '#classify' do
    subject { classifier.classify }

    describe 'when provided a hand with a High Card' do
      let(:to_classify) { [
        Card.new(5, :clubs),
        Card.new(:ace, :diamonds),
        Card.new(10, :spades),
        Card.new(7, :spades),
        Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(Classification::HighCard) }
    end

    describe 'when provided a hand with a pair' do
      let(:to_classify) { [
        Card.new(5, :clubs),
        Card.new(:ace, :diamonds),
        Card.new(:ace, :spades),
        Card.new(7, :spades),
        Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(Classification::Pair) }

    end

    describe 'when provided a hand with two pairs' do
      let(:to_classify) { [
        Card.new(5, :clubs),
        Card.new(:ace, :diamonds),
        Card.new(:ace, :spades),
        Card.new(5, :spades),
        Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(Classification::TwoPair) }
    end

    describe 'when provided a hand with three of a kind' do
      let(:to_classify) { [
        Card.new(5, :clubs),
        Card.new(5, :diamonds),
        Card.new(:ace, :spades),
        Card.new(5, :spades),
        Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(Classification::ThreeOfAKind) }
    end

    describe 'when provided a hand with a flush' do
      let(:to_classify) { [
        Card.new(2, :spades),
        Card.new(4, :spades),
        Card.new(5, :spades),
        Card.new(7, :spades),
        Card.new(9, :spades),
      ] }

      it { is_expected.to be_a(Classification::Flush) }
    end

    describe 'when provided a hand with a full house' do
      let(:to_classify) { [
        Card.new(2, :spades),
        Card.new(2, :clubs),
        Card.new(2, :diamonds),
        Card.new(7, :spades),
        Card.new(7, :clubs),
      ] }

      it { is_expected.to be_a(Classification::FullHouse) }
    end

    describe 'when provided a hand with a numeric straight' do
      let(:to_classify) { [
        Card.new(2, :spades),
        Card.new(3, :clubs),
        Card.new(4, :diamonds),
        Card.new(5, :spades),
        Card.new(6, :clubs),
      ] }

      it { is_expected.to be_a(Classification::Straight) }
    end

    describe 'when provided a hand with a straight ending in ace' do
      let(:to_classify) { [
        Card.new(10, :spades),
        Card.new(:jack, :clubs),
        Card.new(:queen, :diamonds),
        Card.new(:king, :spades),
        Card.new(:ace, :clubs),
      ] }

      it { is_expected.to be_a(Classification::Straight) }
    end

    describe 'when provided a hand with a straight beginning in ace' do
      let(:to_classify) { [
        Card.new(:ace, :spades),
        Card.new(2, :clubs),
        Card.new(3, :diamonds),
        Card.new(4, :spades),
        Card.new(5, :clubs),
      ] }

      it { is_expected.to be_a(Classification::Straight) }
    end
  end
end
