require 'card.rb'

class HandParser

  NON_NUMERIC_VALUES = {
    'A' => :ace,
    'J' => :jack,
    'Q' => :queen,
    'K' => :king,
  }.freeze

  SUITES = {
    'h' => :hearts,
    'c' => :clubs,
    'd' => :diamonds,
    's' => :spades
  }.freeze

  def initialize(to_parse)
    @to_parse = to_parse
  end

  def parse
    @to_parse.
      split(' ').   # TODO: Word boundary regex
      map { |v| card_from(v) }
  end

  private

  def card_from(raw_card)
    Card.new(value_of(raw_card), suite_of(raw_card))
  end

  # TODO: Case-insensitive for following methods
  def suite_of(raw_card)
    SUITES[raw_card[-1]]
  end

  def value_of(raw_card)
    value_portion = raw_card[0..-2]

    if NON_NUMERIC_VALUES.key?(value_portion)
      NON_NUMERIC_VALUES[value_portion]
    else
      Integer(value_portion)
    end
  end
end
