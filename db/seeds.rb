
# Users

vytautas = User.create(name: "Vytautas", phone: 9293019100)
mark = User.create(name: "Mark", phone: 708789908)
will = User.create(name: "Will", phone: 6078908796)

# Restaurants
sardis = Restaurant.create(name: "Sardis")
dominos = Restaurant.create(name: "Dominos")
chilis = Restaurant.create(name: "Chilis")

# Reservations
first_reservation = Reservation.create(user_id: vytautas.id, restaurant_id: sardis.id, date: "03/05/19 - 0900pm")
second_reservation = Reservation.create(user_id: mark.id, restaurant_id: dominos.id, date: "03/06/19 - 0800pm")
third_reservation = Reservation.create(user_id: will.id, restaurant_id: chilis.id, date: "03/07/19 - 0700pm")
