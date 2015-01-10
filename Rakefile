require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'test'
  test.test_files = FileList['test/test_*.rb']
end

desc "Run tests"
task :default => :test