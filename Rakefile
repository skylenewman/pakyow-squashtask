require 'pakyow-rake'
require "sequel"

Sequel.extension :migration


Dir.glob('rake/*.rake').each { |r| import r }
Sequel.extension :migration

namespace :db do
  desc "Create and migrate the database"
  task :setup => [:'pakyow:prepare'] do
    puts "Setting up the database."

    %w(
    db:create
    db:migrate
    ).each {|t|
      puts "[Rake] #{t}"
      Rake::Task[t].invoke
    }
  end # task :setup do

  desc "Reset the database"
  task :reset do
    puts "Resetting the database."

    %w(
    db:drop
    db:setup
    ).each do |t|
      puts "[Rake] #{t}"
      Rake::Task[t].invoke
    end
  end # task :reset do

  desc "Drop the database"
  task :drop => [:'pakyow:prepare'] do
    # database = $db.opts[:database]
    # $db.disconnect
    #
    # `dropdb #{database}`
    $db = Sequel.connect(ENV['DATABASE_URL']) if $db.nil?
    Sequel::Migrator.run($db, 'migrations', target: 0)
  end # task :drop => [:terminate] do

  desc "Create the database"
  task :create => [:'pakyow:prepare'] do
    database = $db.opts[:database]
    $db.disconnect

    `createdb #{database}`
  end # task :create => [:'pakyow:prepare'] do

  desc "Migrate the database"
  task :migrate => [:'pakyow:prepare'] do
    flags = "-M #{ENV['VERSION']}" if ENV['VERSION']
    `sequel -m migrations #{ENV['DATABASE_URL']} #{flags}`
    $db = Sequel.connect(ENV['DATABASE_URL']) if $db.nil?
    Sequel::Migrator.run($db, 'migrations', :use_transactions=>true)
  end

  desc "Seed the database with data"
  task :seed => ['pakyow:stage'] do
    $i = 0
    until $i > 5 do
      $task = Task.new
      $task.name = Faker::Hacker.verb + " " + Faker::Hacker.noun
      $task.due_on = Faker::Time.forward
      $task.save
      $i +=1
    end
  end # task :seed => ['pakyow:stage'] do
end
