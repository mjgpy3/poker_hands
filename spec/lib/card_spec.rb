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

  describe '#to_i' do
    subject { card.to_i }

    {
      :ace => 14,
      2 => 2,
      10 => 10,
      :jack => 11,
      :queen => 12,
      :king => 13,
    }.each do |initialized_value, expected_value|
      describe "when initialized with #{initialized_value}" do
        let(:value) { initialized_value }
        let(:suite) { :clubs }

        it { is_expected.to eq(expected_value) }
      end
    end
  end
end
