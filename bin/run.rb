require_relative '../config/environment'

require_all 'app'
require 'pry'

new_cli = CommandLineInterface.new
new_cli.run


# binding.pry
