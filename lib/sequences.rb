require_relative '../config/environment.rb'

class Helpers

 def user
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what is your name? ", default: "Cap sensitive")
  puts "---------------------------------"
  phone = prompt.ask("What is your phone number? ", default: "6464646 Format")
  puts "##########################################"
  puts "Thank you #{name} and welcome to Reser4you!"
  User.new(name: name, phone: phone).save
 end

 def restaurant
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what's the name of the restaurant? ", default: "Cap sensitive")
  Restaurant.new(name: name).save
 end

 def reservation_date
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  date = prompt.ask("What date you like? ", default: "MM/DD/YY - HOUR")
  date
 end

end

class Sequence < Helpers

def create_reservation
  user
  restaurant
  date = reservation_date
  user_id = User.last.id
  name = User.last.name
  restaurant_id = Restaurant.last.id
  restaurant_name = Restaurant.last.name
  Reservation.new(user_id: user_id, restaurant_id: restaurant_id, date: date).save
  puts "############################################################################"
  puts "Thank you #{name} your reservation is set at #{restaurant_name} for #{date}"
end

 def reservation
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what is your name? ", default: "Cap sensitive")
  puts "##########################################"
  if !User.exists?(name: name)
    puts "There is no record of that User"
  else
  user_id = User.find_by(name: name).id
  date = Reservation.find_by(user_id: user_id).date
  restaurant_id = Reservation.find_by(user_id: user_id).restaurant_id
  restaurant_name = Restaurant.find_by(id: restaurant_id).name
  puts "Thank you #{name} your reservation at #{restaurant_name} is confirmed for #{date}"
  puts "################################################################################"
  end

 end

 def update_reservation
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what is your name? ", default: "Cap sensitive")
  new_date = prompt.ask("Please type the new date", default: "MM/DD/YY - HOUR")
  # puts "---------------------------------"
  # phone = prompt.ask("What is your phone number? ")
  puts "##########################################"
  user_id = User.find_by(name: name).id
  details = Reservation.find_by(user_id: user_id)
  details.update(date: new_date)
  restaurant_id = Reservation.find_by(user_id: user_id).restaurant_id
  restaurant_name = Restaurant.find_by(id: restaurant_id).name
  puts "Thank you #{name} your reservation at #{restaurant_name} is changed for #{details.date}"
  puts "#################################################################"
 end

 def delete
    prompt = TTY::Prompt.new
    puts "---------------------------------"
    name = prompt.ask("what is your name? ", default: "Cap sensitive")
    puts "##########################################"
    user_id = User.find_by(name: name).id
    details = Reservation.find_by(user_id: user_id)
    details.destroy
    puts "Thank you #{name} your reservation is deleted."
 end

end


class Greeting < Sequence

  def progress
  bar = TTY::ProgressBar.new("Loading [:bar]", total: 30)
  30.times do
    sleep(0.1)
    bar.advance(1)
  end
  end

 def welcome
  puts "########################"
  puts "# Welcome to Reser4you #"
  puts "########################"
 end

 def exit
  puts "##################################"
  puts "# Thank you for using Reser4you! #"
  puts "##################################"
  puts "           ##########             "
  puts "           ## Bye! ##             "
  puts "           ##########             "
 end

 def menu
  answer = ""
  until answer == "Exit"
  puts "\e[H\e[2J"
  progress
  welcome
  prompt = TTY::Prompt.new
  puts "------------------------"
  choices = "Create Reservation", "Check Reservation", "Update Reservation" , "Delete Reservation", "Exit"
  answer = prompt.enum_select("Select an editor?", choices)
  case answer
   # when "Create a new User"
   #   user
   when "Create Reservation"
     create_reservation
     puts "Press Enter to continue.."
     gets
   when "Check Reservation"
     reservation
     puts "Press Enter to continue.."
     gets
   when "Update Reservation"
     update_reservation
     puts "Press Enter to continue.."
     gets
   when "Delete Reservation"
     delete
     puts "Press Enter to continue.."
     gets
   when "Exit"
     exit
   end
  end
 end
end
