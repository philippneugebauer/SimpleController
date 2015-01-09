Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'SimpleController'
  spec.version     = '0.0.1'
  spec.date        = '2015-01-08'
  spec.summary     = "Simplifies your rails controller logic to avoid useless redundant code by providing the standard controller methods"
  spec.description = "Simplifying your rails controllers logic"
  spec.authors     = ["Philipp Neugebauer"]
  spec.email       = 'ppn@nexgo.de'
  spec.files       = ["lib/simple_controller.rb"]
  spec.test_files  = ["test/simple_controller_test.rb"]
  spec.homepage    = 'http://rubygems.org/gems/simple_controller'
  spec.license     = 'MIT'
	spec.required_ruby_version = '>= 1.9.3'
	spec.add_dependency 'rails', '>= 4.0'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end