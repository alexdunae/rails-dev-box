gem 'bcrypt'

gem_group :development, :test do
  gem 'quiet_assets'
  gem 'awesome_print'
end

gem_group :test do
  gem 'minitest-rails'
  gem 'timecop'
  gem 'mocha'
end

gem_group :production do
  gem 'rails_12factor'
end

environment <<-'EOC'
  config.generators do |g|
    g.test_framework :mini_test, spec: false, fixture: true
  end
EOC

lib 'tasks/testing.rake', <<-'EOC'
%w(decorators presenters reporters services values workers).each do |key|
  Rails::TestTask.new("test:#{key}" => "test:prepare") do |t|
    t.pattern = "test/#{key}/**/*_test.rb"
    Rake::Task["test:run"].enhance ["test:#{key}"]
  end
end
EOC

run 'bundle install'
generate 'minitest:install'

run 'rm README.rdoc'
run 'touch README.md'
