require 'bundler/setup'
Bundler.require
# require 'rake'
# require 'active_record'
# require 'tty-progressbar'
# require 'tty-prompt'

require_relative '../db/migrate/03_create_users.rb'
require_relative '../db/migrate/02_create_restaurants.rb'
require_relative '../db/migrate/01_create_reservations.rb'
require_relative '../lib/user.rb'
require_relative '../lib/restaurant.rb'
require_relative '../lib/reservations.rb'
require_relative '../lib/sequences.rb'



# put the code to connect to the database here

 ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "db/restaurants.db"
    )

# require_relative '../db/migrate/create_users.rb'
