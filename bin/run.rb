require_relative '../config/environment'


puts Car.all

new_cli = CLI.new
new_cli.greet

new_cli.buy_car?

new_cli.buyer_car_search
