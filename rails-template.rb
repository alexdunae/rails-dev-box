gem 'puma'
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

file 'Procfile', <<-'EOC'
web: bundle exec puma -C config/puma.rb
END

file 'config/puma.rb', <<-'EOC'
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'


on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
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

run 'rm README.rdoc'
run 'touch README.md'
