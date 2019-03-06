# require_relative '../config/environment.rb'
# require_relative '../db/migrate/03_create_users.rb'
# require_relative '../db/migrate/02_create_restaurants.rb'
# require_relative '../db/migrate/01_create_reservations.rb'


class User < ActiveRecord::Base  # Database

  has_many :reservations
  has_many :restaurants, through: :reservations

end


#
# class Reservation < ActiveRecord::Base

  # def self.create
  #   CreateReservations.change
  # end
  #
  # def self.drop
  #   CreateReservations.down
  # end

# end

# User.create
# Restaurant.create
# Reservation.create

# prompt = TTY::Prompt.new
#
# input = prompt.ask("What is your name?", default: "Please type a name!")

# bar = TTY::ProgressBar.new("Testing [:bar]", total: 30, width: 50)
# 30.times do
#   sleep(0.1)
#   bar.advance(1)
# end

# vytautas = User.new(name: "Vytautas", phone: 9293019100)
# mike = User.new(name: "Mike", phone: 3224567896) #row
# vytautas.save
# p User.

# Restaurant.create
# sardis = Restaurant.new(name: "Sardis")
# sardis.save
# reservation = Reservation.new()
# Reservation.create

# user_id = User.find_by(name: "Vytautas").id
# p user_id
# restaurant_id = Restaurant.find(1).id
# reservation = Reservation.new(user_id: user_id, restaurant_id: restaurant_id, date: "03/04/19 - 07:00pm")
# p reservation.date
# p User.new
