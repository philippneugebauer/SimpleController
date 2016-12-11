begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:prep_test) do
  sh %{cd test/dummy && RAILS_ENV=test DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate}
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :test => :prep_test

task default: :test
