require 'bundler/setup'
require 'pakyow'

Pakyow::App.define do
  configure do
    Bundler.require :default, Pakyow::Config.env

    if defined?(Dotenv)
      env_path = ".env.#{Pakyow::Config.env}"
      Dotenv.load env_path if File.exist?(env_path)
      Dotenv.load

      if @db.nil?
        @db = Sequel.connect(ENV['DATABASE_URL'])
      end
    end

    app.name = 'pakyow-squashtask'
  end

  configure :development do
    # development config goes here

  end

  configure :production do
    # production config goes here
  end
end
