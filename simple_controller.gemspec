$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_controller/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'simple_controller'
  spec.version     = SimpleController::VERSION
  spec.date        = '2015-01-08'
  spec.authors     = ["Philipp Neugebauer"]
  spec.email       = ["ppn@philippneugebauer.net"]
  spec.files       = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.homepage    = 'http://rubygems.org/gems/simple_controller'
  spec.summary     = "Simplifies your rails controller logic to avoid useless redundant code by providing the standard controller methods"
  spec.description = "Simplifying your rails controllers logic"
  spec.license     = 'MIT'

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.test_files = Dir["test/**/*"]

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_dependency 'rails', '~> 4.0'
  spec.add_dependency 'activesupport', '~> 4.0'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'jquery-rails'
  spec.add_dependency 'tzinfo-data'
end
