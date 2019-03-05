# require_relative '../config/environment.rb'
# ../ a tree up

class CreateUsers < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
    end
  end

  def down
    drop_table :users
  end

end

# class CreateRestaurants < ActiveRecord::Migration[5.2]
#
#   def self.change
#     create_table :restaurants do |t|
#       t.string :name
#     end
#   end
#
#   def self.down
#     drop_table :restaurants
#   end
#
# end
#
# class CreateReservations < ActiveRecord::Migration[5.2]
#
#   def self.change
#     create_table :reservations do |t|
#       t.integer :user_id
#       t.integer :restaurant_id
#       t.string :date
#     end
#   end
#
#   def self.down
#     drop_table :reservations
#   end
#
# end
