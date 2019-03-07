require_relative '../config/environment.rb'

class Helpers

 def user
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what is your name? ", default: "Cap sensitive")
  puts "---------------------------------"
  if User.exists?(name: name)
    puts "Thank you #{name} and welcome back to Reser4you!"
  else
   phone = prompt.ask("What is your phone number? ", default: "6464646 Format")
   puts "##########################################"
   puts "Thank you #{name} and welcome to Reser4you!"
   User.create(name: name, phone: phone)
  end
  name
 end

 def restaurant
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what's the name of the restaurant? ", default: "Cap sensitive")
  if !Restaurant.exists?(name: name)
  Restaurant.create(name: name)
  end
  name
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
    name = user
    rest_name = restaurant
    date = reservation_date
    user_info = User.find_by(name: name)
    restaurant_id = Restaurant.find_by(name: rest_name).id
    Reservation.create(user_id: user_info.id, restaurant_id: restaurant_id, date: date)
    puts "################################################################################"
    puts "Thank you #{user_info.name} your reservation is set at #{rest_name} for #{date}"
end

 def check_reservation
   prompt = TTY::Prompt.new
   puts "---------------------------------"
   name = prompt.ask("what is your name? ", default: "Cap sensitive")
   puts "#####################################################################################"
  if !User.exists?(name: name)
    puts "There is no record of that User"
  elsif User.find_by(name: name).reservations.empty?
    puts "There is no record of any reservation for that User"
  else
  user = User.find_by(name: name) # The instance of user
  puts "Your reservation at #{user.reservations[0].restaurant.name} is confirmed for #{user.reservations[0].date}"
  puts "######################################################################################"
  end

 end

 def update_reservation
  name = user
  puts "#####################################################################################"
  if !User.exists?(name: name)
    puts "There is no record of that User"
  else
  date = reservation_date
  user_info = User.find_by(name: name)
  new_date = user_info.reservations[0].update(date: date)
  puts "Thank you #{user_info.name} your reservation at #{user_info.reservations[0].restaurant.name} is changed for #{date}"
  puts "#######################################################################################"
 end
 end

 def delete
    prompt = TTY::Prompt.new
    puts "---------------------------------"
    name = prompt.ask("what is your name? ", default: "Cap sensitive")
    puts "---------------------------------"
    puts "#############################################"
    if !User.exists?(name: name)
      puts "There is no record of that User"
    else
    user_info = User.find_by(name: name)
    user_info.destroy
    puts "The record is deleted"
  end
end

def check
  prompt = TTY::Prompt.new
  puts "---------------------------------"
  name = prompt.ask("what is your name? ", default: "Cap sensitive")
  puts "---------------------------------"
  puts "#############################################"
  if !User.exists?(name: name)
    puts "There is no record of that User"
  else
   user_info = User.find_by(name: name)
   puts "This is the list of all your restaurants in your reservations"
   user_info.restaurants.each {|res| puts " - #{res.name}"}
 end
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
  puts "####    v 0.0.0     ####"
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
  puts "              Loading, please wait"
  print "\a"
  progress
  puts "\e[H\e[2J"
  welcome
  prompt = TTY::Prompt.new
  puts "------------------------"
  choices = "Create Reservation", "Check Reservation", "Update Reservation" , "Delete Reservation", "Check all restaurants", "Exit"
  answer = prompt.enum_select("Select an editor?", choices)
  case answer
   when "Create Reservation"
     create_reservation
     puts "Press Enter to continue.."
     gets
   when "Check Reservation"
     check_reservation
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
   when "Check all restaurants"
     check
     puts "Press Enter to continue.."
     gets
   when "Exit"
     puts "\e[H\e[2J"
     exit
     puts "     \u00A9" + "By Vytautas Klimavicius"
     puts ""
   end
  end
 end
end
