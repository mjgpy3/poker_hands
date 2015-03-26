require './spec/spec_helper.rb'
require './lib/hand_classifier.rb'
require './lib/card.rb'
require './lib/classification/high_card.rb'
require './lib/classification/pair.rb'

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
  end
end