# require_relative '../config/environment.rb'

class CreateReservations < ActiveRecord::Migration[5.2]

  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :date
    end
  end

  def down
    drop_table :reservations
  end

end
