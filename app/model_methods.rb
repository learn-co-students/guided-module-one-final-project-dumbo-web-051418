

def screen_splash(ezpass)
  system 'clear'
  <<-HEREDOC
  \t\t\t\t ------------------------
  \t\t\t\t\| EZPass Balance: $#{'%.2f' % ezpass.balance} \|
  \t\t\t\t ------------------------
  \n
  HEREDOC
end

def first_screen(ezpass)
<<-HEREDOC
#{screen_splash(ezpass)}
Where would you like to start today?
(1) Manhattan
(2) Brooklyn
(3) Queens
(4) The Bronx
(5) Staten Island
(6) New Jersey
HEREDOC
end

def areas
   ["Manhattan", "Brooklyn", "Queens", "The Bronx", "Staten Island", "New Jersey"]
end

def second_screen(ezpass, destination)
  puts screen_splash(ezpass)
  current_area = areas[destination-1]
  puts "You are now in #{current_area}"
  puts "Where do you want to drive over?"
  possible_crossings = Crossing.crossings_by_location(current_area)
  possible_crossings.each_with_index do |crossing, index|
    puts "   (#{index+1})  #{crossing.structure.name} -- #{crossing.end_location.name}"
  end
end



# SECOND SCREEN
#                                       -----------------------
#                                      | EZPass Balance: $X.XX |
#                                       -----------------------
#
# You're now in ___.
# Where do you want to drive over?
# ...
#
# # THIRD SCREEN
#                                        -----------------------
#                                       | EZPass Balance: $X.XX |
#                                        -----------------------
#
# You just drove over ___. That cost ___.
# You're now in ___.
# Where do you want to drive over?
# ...
