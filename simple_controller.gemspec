Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'SimpleController'
  s.version     = '0.0.1'
  s.date        = '2015-01-08'
  s.summary     = "Simplifies your rails controller logic to avoid useless redundant code by providing the standard controller methods"
  s.description = "Simplifying your rails controllers logic"
  s.authors     = ["Philipp Neugebauer"]
  s.email       = 'ppn@nexgo.de'
  s.files       = ["lib/simple_controller.rb"]
  s.homepage    = 'http://rubygems.org/gems/simple_controller'
  s.license     = 'MIT'
	s.required_ruby_version = '>= 1.9.3'
	s.add_dependency 'rails', '>= 4.0'
end