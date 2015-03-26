require 'hand_parser.rb'
require 'hand_classifier.rb'

module PokerHands
  def self.classify(raw_hand)
    hand = HandParser.new(raw_hand).parse
    HandClassifier.new(hand).classify
  end
end
