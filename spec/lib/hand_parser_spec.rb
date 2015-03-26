require './spec/spec_helper.rb'
require './lib/card_parser.rb'
require './lib/card.rb'

describe CardParser do
  let(:card_parser) { CardParser.new(hand) }

  describe '#parse' do
    subject(:parsed) { card_parser.parse }

    describe 'given an empty string' do
      let(:hand) { '' }

      it { is_expected.to eq([]) }
    end

    describe 'given a string containing a single card (the ace of hearts)' do
      let(:hand) { 'Ah' }

      describe '.size' do
        subject { parsed.size }

        it { is_expected.to be(1) }
      end

      describe '#first' do
        subject(:first) { parsed.first }

        it { is_expected.to be_a(Card) }

        describe '#suite' do
          subject { first.suite }

          it { is_expected.to be(:hearts) }
        end

        describe '#value' do
          subject { first.value }

          it { is_expected.to be(:ace) }
        end
      end
    end

    describe 'given a string with two cards (the second is the 10 of clubs)' do
      let(:hand) { '7d 10c' }

      describe '.size' do
        subject { parsed.size }

        it { is_expected.to be(2) }
      end

      describe '#last' do
        subject(:last) { parsed.last }

        it { is_expected.to be_a(Card) }

        describe '#suite' do
          subject { last.suite }

          it { is_expected.to be(:clubs) }
        end

        describe '#value' do
          subject { last.value }

          it { is_expected.to be(10) }
        end
      end
    end

    describe 'given a string with five cards' do
      let(:hand) { 'Ah As 10c 7d 6s' }

      describe '.size' do
        subject { parsed.size }

        it { is_expected.to be(5) }
      end
    end
  end
end
