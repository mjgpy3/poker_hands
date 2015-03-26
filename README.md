# Classifying Poker Hands

Built in Ruby 1.9.3

The code is generally written in Object Oriented style, with a focus on immutability.

## Installing/running:
Ensure you have bundler installed
```
gem install bundler
```

Install testing dependencies, using bundle in the app's root
```
bundle install
```

Build the gem
```
gem build poker_hands.gemspec
```

Install the gem
```
gem install poker_hands-0.0.1.gem
```

### Run tests
In the app's root, run
```
rspec
```

### Manually try the gem
Launch `irb` and do something like the following
```
irb(main):001:0> require 'poker_hands'
=> true
irb(main):002:0> PokerHands.classify('Kh Qh 6h 2h 9h')
=> Flush: Hearts
```
