require "bundler/gem_tasks"
require 'rake/testtask'

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |test|
  test.libs << 'test'
  test.test_files = FileList['test/*_test.rb']
end

desc "Run tests"
task :default => :test