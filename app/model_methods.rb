

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
  puts <<-HEREDOC
  #{screen_splash(ezpass)}
  Where would you like to start today?
  HEREDOC
  Location.print_hash
end


def second_screen(ezpass, location)
  puts screen_splash(ezpass)
  #current_area = areas[destination]
  puts "You are now in #{location}"
  puts "Where do you want to drive over?"
  cross_hash = Crossing.print_hash(location)
end
