require_relative './app.rb'

if ENV['RACK_ENV'] == 'production'
  puts 'Loading environment variables for the production environment...'

  require 'dotenv'
  Dotenv.load

  puts "BASIC_AUTH=#{ENV['BASIC_AUTH']}"
end

run Healthchecker::Application
