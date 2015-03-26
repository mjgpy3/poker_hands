require './spec/spec_helper.rb'
require './lib/hand_parser.rb'
require './lib/card.rb'

describe HandParser do
  let(:card_parser) { HandParser.new(hand) }

  describe '#parse' do
    subject(:parsed) { card_parser.parse }

    context 'when given an empty string' do
      let(:hand) { '' }

      it { is_expected.to eq([]) }
    end

    context 'when given a string containing a single card (the ace of hearts)' do
      let(:hand) { 'Ah' }

      describe '#size' do
        subject { parsed.size }

        it { is_expected.to be(1) }
      end

      describe '#first' do
        subject(:first) { parsed.first }

        it { is_expected.to be_a(Card) }

        describe '#suit' do
          subject { first.suit }

          it { is_expected.to be(:hearts) }
        end

        describe '#value' do
          subject { first.value }

          it { is_expected.to be(:ace) }
        end
      end
    end

    context 'when given a string with two cards (the second is the 10 of clubs)' do
      let(:hand) { '7d 10c' }

      describe '#size' do
        subject { parsed.size }

        it { is_expected.to be(2) }
      end

      describe '#last' do
        subject(:last) { parsed.last }

        it { is_expected.to be_a(Card) }

        describe '#suit' do
          subject { last.suit }

          it { is_expected.to be(:clubs) }
        end

        describe '#value' do
          subject { last.value }

          it { is_expected.to be(10) }
        end
      end
    end

    context 'when given a string with five cards' do
      let(:hand) { 'Ah As 10c 7d 6s' }

      describe '#size' do
        subject { parsed.size }

        it { is_expected.to be(5) }
      end
    end

    context 'when given a string with five cards and irregular spacing' do
      let(:hand) { "  Ah    As 10c\t7d    6s" }

      describe '#size' do
        subject { parsed.size }

        it { is_expected.to be(5) }
      end
    end

    context 'when given a string a card that has different casing (aH)' do
      let(:hand) { 'aH' }


      describe '#first' do
        let(:first) { parsed.first }

        describe '#suit' do
          subject { first.suit }

          it { is_expected.to be(:hearts) }
        end

        describe '#value' do
          subject { first.value }

          it { is_expected.to be(:ace) }
        end
      end

      describe '#size' do
        subject { parsed.size }

        it { is_expected.to be(1) }
      end
    end
  end
end
