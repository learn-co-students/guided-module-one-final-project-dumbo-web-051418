# Passenger.create(first_name: "Jon", last_name: "Brown", passport_num: 21)
# Passenger.create(first_name: "Val", last_name: "Hart", passport_num: 35)
# Passenger.create(first_name: "Meg", last_name: "Griffin", passport_num: 16)

Flight.create(name: "Emirates", departure_time: "10:00", seat: "B1", meal: true, zone: "Economy",
              start_location: "Los Angeles", end_location: "Dubai", flight_number: 1354)
Flight.create(name: "American Airlines", departure_time: "16:00", seat: "F9", meal: false, zone: "Economy",
              start_location: "New York", end_location: "Hanoi", flight_number: 783)
Flight.create(name: "Singapore Air", departure_time: "02:00", seat: "3P", meal: true, zone: "First Class",
               start_location: "New York", end_location: "Shanghai", flight_number: 902)
Flight.create(name: "SpaceX", departure_time: "When we get our Model 3's", seat: "1", meal: true, zone: "Front and Center",
             start_location: "Cape Canaveral, FL", end_location: "Mars", flight_number: 1)


# Ticket.create(ticket_num: 29357, passenger_id: 1, flight_id: 2)
# Ticket.create(ticket_num: 39475, passenger_id: 2, flight_id: 1)
# Ticket.create(ticket_num: 28347, passenger_id: 3, flight_id: 3)
