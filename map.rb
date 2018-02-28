



require 'colorize'
require "highline/import"

#Formatting
alignment = ""
 $align = " ".ljust(50)
 $center = "\n"
 $line_top = "#{$center}#{$align}_____________________________________________________\n".red
 $line_bottom  ="#{$align}_____________________________________________________\n\n".red


def menu_b
  puts "#{$align}Would you like to:\n".green
  puts "#{$align}Inspect the room:[i]"
  puts "#{$align}Cry like a little baby:[c]"
end

def nav_n
  puts "\n#{$align}Leave through the north facing door:[n]".blue
end
def nav_s
  puts "\n#{$align}Leave through the south facing door:[s]".blue
end
def nav_e
  puts "\n#{$align}Leave through the east facing door:[e]".blue
end
def nav_w
  puts "\n#{$align}Leave through the west facing door:[w]".blue
end

def cry
  loop do
    puts "#{$center}#{$align}Waaaaaahhhh!"
    sleep 1
    puts "#{$center}#{$align}Waaaaaahhhh!"
  end

end

def room_1_i
  puts "#{$align}There is an item in here!"
  puts $line_bottom
end

def room_1
  puts $line_top
  puts "#{$align}                      Room 1\n".bold.yellow
  puts "#{$align}You have awoken in a room with blood spattered walls.".green
  puts "#{$align}You hear moaning in the room next to you.\n".green
  puts "#{$align}There is one door out.".blue
  puts $line_bottom
end
def room_2
  puts $line_top
  puts "#{$align}                      Room 2\n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 3 doors out.".blue
  puts $line_bottom
end
def room_3
  puts $line_top
  puts "#{$align}                      Room 3\n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 2 doors out.".blue
  puts $line_bottom
end
def room_4
  puts $line_top
  puts "#{$align}                      Room 4\n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 2 doors out.".blue
  puts $line_bottom
end
def room_5
  puts $line_top
  puts "#{$align}                      Room 5\n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 2 doors out.".blue
  puts $line_bottom
end
def room_6
  puts $line_top
  puts "#{$align}                      Room 6 \n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 3 doors out.".blue
  puts $line_bottom
end
def room_7
  puts $line_top
  puts "#{$align}                      Room 7\n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 2 doors out.".blue
  puts $line_bottom
end
def room_8
  puts $line_top
  puts "#{$align}                      Room 8\n".yellow
  puts "#{$align}".green
  puts "#{$align}There are 2 doors out.".blue
  puts $line_bottom
end

def north
  $input == 'n'
end
def south
  $input == 's'
end
def east
  $input == 'e'
end
def west
  $input == 'w'
end







$input = ""
system('clear')
# Room 1
loop do
  room_1
  room_1_i if $input == "i"
  menu_b
  nav_s

  $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
  system('clear')

  case
  when $input == 'i'

    when south
        system('clear')
# Room 2
        loop do
          room_2
          room_1_i if $input == "i"
          menu_b
          nav_n
          nav_s
          nav_w

          $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
          system('clear')

          case
          when $input == 'i'
          when north
            break

          when $input == 'c'
          cry

            when west
# Room 3
              loop do
                room_3
                room_1_i if $input == "i"
                menu_b
                nav_e


                $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
                system('clear')

                case
                 when $input == 'i'



                 when $input == 'c'
                    cry
                 when $input = 'e'
                    break
                end
              end


            when south
# Room 4
              loop do
                room_4
                room_1_i if $input == "i"
                menu_b
                nav_n
                nav_s

                $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
                system('clear')

                case
                 when $input == 'i'
                 when north
                   break

                 when $input == 'c'
                 cry

                 when south
#room 5
                    loop do
                      room_5
                      room_1_i if $input == "i"
                      menu_b
                      nav_n
                      nav_e

                      $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
                      system('clear')

                      case
                       when $input == 'i'

                       when north
                         break

                       when $input == 'c'
                       cry

                     when east
# room 6
                          loop do
                            room_6
                            room_1_i if $input == "i"
                            menu_b
                            nav_s
                            nav_e
                            nav_w

                            $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
                            system('clear')

                            case
                              when $input == 'i'

                              when $input == 'c'
                              cry
                            when west
                              break

                            when east
# Room 7
                              loop do
                                room_7
                                room_1_i if $input == "i"
                                menu_b
                                nav_w


                                $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
                                system('clear')

                                case
                                    when $input == 'i'

                                    when west
                                      break

                                    when $input == 'c'
                                    cry
                                end
                              end


                            when south
# Room 8
                                loop do
                                  room_8
                                  room_1_i if $input == "i"
                                  menu_b
                                  nav_n


                                  $input = ask("\n#{$align}Make you decision (Don't f*** up!): ").downcase
                                  system('clear')

                                  case
                                      when $input == 'i'

                                      when north
                                        break

                                      when $input == 'c'
                                      cry
                                  end
                                end

                            end
                          end
                      end
                    end
                end
              end
          end
        end
  end

end
