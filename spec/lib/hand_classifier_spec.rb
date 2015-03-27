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
require './lib/classification/straight_flush.rb'

describe PokerHands::HandClassifier do
  let(:classifier) { PokerHands::HandClassifier.new(to_classify) }

  describe '#classify' do
    subject(:classified) { classifier.classify }

    context 'when provided a hand with a high card (ace of diamonds)' do
      let(:to_classify) { [
        PokerHands::Card.new(5, :clubs),
        PokerHands::Card.new(:ace, :diamonds),
        PokerHands::Card.new(10, :spades),
        PokerHands::Card.new(7, :spades),
        PokerHands::Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::HighCard) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("High Card: Ace of Diamonds") }
      end
    end

    context 'when provided a hand with a pair' do
      let(:to_classify) { [
        PokerHands::Card.new(5, :clubs),
        PokerHands::Card.new(:ace, :diamonds),
        PokerHands::Card.new(:ace, :spades),
        PokerHands::Card.new(7, :spades),
        PokerHands::Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::Pair) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Pair: Ace of Diamonds and Ace of Spades") }
      end
    end

    context 'when provided a hand with two pairs' do
      let(:to_classify) { [
        PokerHands::Card.new(5, :clubs),
        PokerHands::Card.new(:ace, :diamonds),
        PokerHands::Card.new(:ace, :spades),
        PokerHands::Card.new(5, :spades),
        PokerHands::Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::TwoPair) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.
          to eq("Two Pair: 5 of Clubs and 5 of Spades; Ace of Diamonds and Ace of Spades") }
      end
    end

    context 'when provided a hand with three of a kind' do
      let(:to_classify) { [
        PokerHands::Card.new(5, :clubs),
        PokerHands::Card.new(5, :diamonds),
        PokerHands::Card.new(:ace, :spades),
        PokerHands::Card.new(5, :spades),
        PokerHands::Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::ThreeOfAKind) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.
         to eq("Three of a Kind: 5 (Clubs, Diamonds, Spades)") }
      end
    end

    context 'when provided a hand with four of a kind' do
      let(:to_classify) { [
        PokerHands::Card.new(5, :clubs),
        PokerHands::Card.new(5, :diamonds),
        PokerHands::Card.new(5, :spades),
        PokerHands::Card.new(5, :hearts),
        PokerHands::Card.new(2, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::FourOfAKind) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.
         to eq("Four of a Kind: 5") }
      end
    end

    context 'when provided a hand with a flush' do
      let(:to_classify) { [
        PokerHands::Card.new(2, :spades),
        PokerHands::Card.new(4, :spades),
        PokerHands::Card.new(5, :spades),
        PokerHands::Card.new(7, :spades),
        PokerHands::Card.new(9, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::Flush) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Flush: Spades") }
      end
    end

    context 'when provided a hand with a full house' do
      let(:to_classify) { [
        PokerHands::Card.new(:ace, :spades),
        PokerHands::Card.new(:ace, :clubs),
        PokerHands::Card.new(:ace, :diamonds),
        PokerHands::Card.new(7, :spades),
        PokerHands::Card.new(7, :clubs),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::FullHouse) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Full House: three Aces and two 7s") }
      end
    end

    context 'when provided a hand with a numeric straight' do
      let(:to_classify) { [
        PokerHands::Card.new(2, :spades),
        PokerHands::Card.new(3, :clubs),
        PokerHands::Card.new(4, :diamonds),
        PokerHands::Card.new(5, :spades),
        PokerHands::Card.new(6, :clubs),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::Straight) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Straight: 2 of Spades through 6 of Clubs") }
      end
    end

    context 'when provided a hand with a straight ending in ace' do
      let(:to_classify) { [
        PokerHands::Card.new(10, :spades),
        PokerHands::Card.new(:jack, :clubs),
        PokerHands::Card.new(:queen, :diamonds),
        PokerHands::Card.new(:king, :spades),
        PokerHands::Card.new(:ace, :clubs),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::Straight) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Straight: 10 of Spades through Ace of Clubs") }
      end
    end

    context 'when provided a hand with a straight beginning in ace' do
      let(:to_classify) { [
        PokerHands::Card.new(:ace, :spades),
        PokerHands::Card.new(2, :clubs),
        PokerHands::Card.new(3, :diamonds),
        PokerHands::Card.new(4, :spades),
        PokerHands::Card.new(5, :clubs),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::Straight) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Straight: Ace of Spades through 5 of Clubs") }
      end
    end

    context 'when provided a hand with a straight flush' do
      let(:to_classify) { [
        PokerHands::Card.new(:ace, :spades),
        PokerHands::Card.new(2, :spades),
        PokerHands::Card.new(3, :spades),
        PokerHands::Card.new(4, :spades),
        PokerHands::Card.new(5, :spades),
      ] }

      it { is_expected.to be_a(PokerHands::Classification::StraightFlush) }

      describe '#to_s' do
        subject { classified.to_s }

        it { is_expected.to eq("Straight Flush: Ace of Spades through 5 of Spades") }
      end
    end
  end
end
