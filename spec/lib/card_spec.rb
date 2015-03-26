require './spec/spec_helper.rb'
require './lib/card.rb'

describe Card do
  let(:card) { Card.new(value, suite) }

  describe '#to_s' do
    subject { card.to_s }

    describe 'when the card was initialized with :ace and :spades' do
      let(:value) { :ace }
      let(:suite) { :spades }

      it { is_expected.to eq('Ace of Spades') }
    end

    describe 'when the card was initialized with 10 and :clubs' do
      let(:value) { 10 }
      let(:suite) { :clubs }

      it { is_expected.to eq('10 of Clubs') }
    end
  end
end
