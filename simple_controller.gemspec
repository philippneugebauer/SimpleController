$:.push File.expand_path("../lib", __FILE__)
require 'simple_controller/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'simple_controller'
  spec.version     = SimpleController::VERSION
  spec.date        = '2015-01-08'
  spec.summary     = "Simplifies your rails controller logic to avoid useless redundant code by providing the standard controller methods"
  spec.description = "Simplifying your rails controllers logic"
  spec.authors     = ["Philipp Neugebauer"]
  spec.email       = 'ppn@nexgo.de'
  spec.files       = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.test_files  = ["test/test_simple_controller.rb"]
  spec.homepage    = 'http://rubygems.org/gems/simple_controller'
  spec.license     = 'MIT'
	spec.required_ruby_version = '>= 1.9.3'
	spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'activesupport', '~> 4.2.0'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'codeclimate-test-reporter'
end