require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative "config/environment"

require ::File.expand_path('../config/environment', __FILE__)

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r ./config/environment"
end

namespace :generate do
  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration[5.1]
          def change
          end
        end
      EOF
    end
  end
end

namespace :db do
  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true

    migrations_directory = "#{APP_ROOT}db/migrate"
    ActiveRecord::Migrator.migrations_paths << migrations_directory
    ActiveRecord::Migrator.migrate ActiveRecord::Migrator.migrations_paths
  end
end
