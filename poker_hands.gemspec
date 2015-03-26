Gem::Specification.new do |s|
  s.name = 'poker_hands'
  s.version = '0.0.1'
  s.licenses = ['MIT']
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Michael Gilliland']
  s.homepage = 'https://github.com/mjgpy3/poker_hands'
  s.date = '2015-03-25'
  s.summary = 'Classifying poker hands'
  s.description = 'Classifying poker hands'
  s.files = Dir.glob("lib/**/*") +
    ['poker_hands.gemspec',
     'README.md',
     './lib/poker_hands.rb']
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
