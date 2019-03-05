# require_relative '../config/environment.rb'

class CreateRestaurants < ActiveRecord::Migration[5.2]

  def change
    create_table :restaurants do |t|
      t.string :name
    end
  end

  def down
    drop_table :restaurants
  end

end
