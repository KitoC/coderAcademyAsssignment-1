



require 'colorize'
require "highline/import"

#Formatting
alignment = ""
 $align = " ".ljust(50)
 $center = "\n"
 $map_align = " ".ljust(16)
 $line_top = "#{$center}#{$align}_____________________________________________________\n".red
 $line_bottom  ="#{$align}_____________________________________________________".red
 decision = "Make you decision (Don't f*** up!):".yellow

 $dmg_h = 0
 $dmg_z = 0
 $sprite = 0
 $sec_door_lock = false
 $sec_lock_discover = false
 $key_found = false


def inv_stats
  puts "#{$align}#{$profile[:name]}'s Health:".green + " #{$profile[:health]}".white + " Attack:".green + " #{$profile[:attack]}".white + " Speed:".green + " #{$profile[:speed]}".white + " Bandaids:".green + " #{$profile[:bandaid]}".white
  puts "#{$align}Weapon:".green + " #{$weapon}\n".yellow
  puts "#{$align}You smell like #{$profile[:body_odor]}\n".green
  if $key_found == true
    puts "#{$align}Key added to inventory."
  end
end

def menu_b
  inv_stats
  puts $line_bottom
  puts "\n#{$align}Would you like to:\n".green
  puts "#{$align}Inspect the room:[i]".yellow
  puts "#{$align}Cry like a little baby:[c]".yellow
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
  puts "#{$align}There is hammer in here! (equip hammer [h])"
  if $sec_lock_discover == true;  puts "#{$align}The code is #{"0 4 3 2".red}"
     $sec_door_lock = true
  end

  puts $line_bottom
end
def room_3_i
  puts "#{$align}There is a dead body behind the desk (loot [l])"
  puts $line_bottom
end

def room_6_i
  puts "#{$align}The security room door needs a code!"
  puts "#{$align}The lobby door needs a key!"

  puts $line_bottom
end
def room_7_i
  puts "#{$align}There is a handgun in here (equip hammer [g])"
  puts $line_bottom
end



def room_1
  puts $line_top
  puts "#{$align}                      Room 1\n".bold.yellow
  puts "#{$align}You have awoken in a room with blood spattered walls.".green
  puts "#{$align}You notice someone has written some numbers in blood\n#{$align}on one of the walls.".red
  puts "#{$align}You hear moaning in the room next to you.\n".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + "x".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
    puts "#{$align}There is one door out.\n".blue
    puts $line_bottom
end
def room_2
  puts $line_top
  puts "#{$align}                      Room 2\n".yellow
  puts "#{$align}".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + "x".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
    puts "#{$align}There are 3 doors out.\n".blue
    puts $line_bottom
end
def room_3
  puts $line_top
  puts "#{$align}                      Room 3\n".yellow
  puts "#{$align}".green
      puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
      puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
      puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
      puts "#{$align}#{$map_align} | ".green + "x".white + " | ".red + " ".white + " |".green
      puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
      puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
      puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
      puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + " ".white + " | ".red + " ".white + " |".green
      puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
      puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
      puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
      puts "#{$align}There is 1 doors out.\n".blue
  puts $line_bottom
end
def room_4
  puts $line_top
  puts "#{$align}                      Room 4\n".yellow
  puts "#{$align}".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align}     | ".green + "x".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
    puts "#{$align}There are 2 doors out.\n".blue
  puts $line_bottom
end
def room_5
  puts $line_top
  puts "#{$align}                      Room 5\n".yellow
  puts "#{$align}".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + "x".white + " | ".red + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
    puts "#{$align}There are 2 doors out.\n".blue
  puts $line_bottom
end
def room_6
  puts $line_top
  puts "#{$align}                      Room 6".yellow
  puts "#{$align}To the south you see some frosted glass doors with".green
  puts "#{$align}a large dark shape moving about.\n".green
  puts "#{$align}To the east you see a heavy wooden door with ".green
  puts "#{$align}'security' written across it.".green
  puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
  puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
  puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
  puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + " ".white + " |".green
  puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
  puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
  puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
  puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + "x".white + " | ".red + " ".white + " |".green
  puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
  puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
  puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
  puts "#{$align}There are 3 doors out.\n".blue
  puts $line_bottom
end
def room_7
  puts $line_top
  puts "#{$align}                      Room 7\n".yellow
  puts "#{$align}".green
  puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
  puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
  puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
  puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + " ".white + " |".green
  puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
  puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
  puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
  puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + " ".white + " | ".red + "x".white + " |".green
  puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
  puts "#{$align}#{$map_align}         | ".green + " ".white + " |".green
  puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
  puts "#{$align}There is 1 door out.\n".blue
  puts $line_bottom
end
def room_8
  puts $line_top
  puts "#{$align}                      Room 8\n".yellow
  puts "#{$align}".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align} | ".green + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}     | ".green + " ".white + " | ".red + " ".white + " | ".red + " ".white + " |".green
    puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
    puts "#{$align}#{$map_align}         | ".green + "x".white + " |".green
    puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
    puts "#{$align}There are 2 doors out.\n".blue
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


def zombie_graphic
    puts "\n\n\n\n\n#{$align}"+'                                .....            '.yellow
    puts "#{$align}"+'                               C C  /            '.green
    puts "#{$align}"+'                              /<   /             '.green
    puts "#{$align}"+'               ___ __________'+'/_"'.green + '#'.red + "__=o             ".green
    puts "#{$align}"+'               /(- /(\_'.green + '\________   \              '
    puts "#{$align}"+'               \ ) \ )_'.green + '      \o     \             '
    puts "#{$align}"+'               '+'/|\ /|\ '.green+'      |      |             '
    puts "#{$align}"+'                             |     _|             '
    puts "#{$align}"+'                             /o   __\             '
    puts "#{$align}"+'                            /       |             '
    puts "#{$align}"+'                           / /      |             '
    puts "#{$align}"+'                          /_/\______|             '
    puts "#{$align}"+'                         (   _(    <              '
    puts "#{$align}"+'                          \    \    \             '
    puts "#{$align}"+'                           \    \    |            '
    puts "#{$align}"+'                            \____\____\           '
    puts "#{$align}"+'                            ____\_\__\_\          '.yellow
    puts "#{$align}"+'                          /`   /`     o\          '.yellow
    puts "#{$align}"+'                          |___ |_______|'.yellow
end

def battle_data
  puts $line_bottom
  puts "#{$align}                      ".bold.yellow
  puts "#{$align}Your health: #{$profile[:health].to_s.red}hp.".yellow
  puts "\n#{$align}Zombies health: #{$zombie[:health].to_s.red}hp.".green
  puts "\n#{$align}You hit the zombie for: #{$dmg_h.to_s.red} damage.".yellow
  puts "\n#{$align}The zombies hits you for: #{$dmg_z.to_s.red} damage.".green
  puts $line_bottom
end

def bandaid_use
  case
  when $input == "b"
    # puts "Hello!"
    if $profile[:bandaid] >= 1

      $profile[:bandaid] -= 1
      $profile[:health] += 10
    else
      puts "\n".center(10)
      puts "#{$center}#{$align}Oh shiiiieet! You ain't got any left..."
      sleep 2
      system('clear')
     end
    end

end


$hammer = 3
$gun = 8
$profile = {name: "Brad", attack: 10, speed: 0, health: 100, smell: 0, body_odor: "" , weapon: 0, bandaid: 2}

$zombie = {health: 15, attack: 10}

$weapon = "Bare bloody fists (base damage:  #{$profile[:weapon]})"


# $sprite = true

def battle
  $sprite = rand $profile[:smell]
  if $sprite == 1
    loop do
      system('clear')
      zombie_graphic
      puts $line_bottom
      puts "#{$align}A rabid zombie scientist comes out of nowhere at you!".green
      puts $line_bottom


      input = ask "\n#{$align}What do you do? (run[r]), (fight[f]): ".green
      puts $line_bottom

      system('clear')

      case
      when input == "r"
        $run = rand $profile[:speed]
        if $run == 1
          break
        end
      when input == "f"
        loop do
          zombie_graphic
          puts $line_bottom
          inv_stats
          battle_data

          input = ask "\n#{$align} Hit zombie [h]:\n#{$align} Use bandaid[b]: ".green
          system('clear')
            case
               when input == "h"

                  $dmg_h = rand $profile[:weapon]..$profile[:attack]
                  $dmg_z = rand 7

                  $zombie[:health] -= $dmg_h

                  $profile[:health] -= $dmg_z
                when input == "b"
                  if $profile[:bandaid] >= 1

                      $profile[:bandaid] -= 1
                      $profile[:health] += 10
                      $dmg_z = rand 7

                      $zombie[:health] -= $dmg_h
                    else
                      puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                      puts "#{$center}#{$align}Oh shiiiieet! You ain't got any left...".yellow
                      sleep 2
                      system('clear')
                   end


                when $profile[:health] <= 0
                  system('clear')
                puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                puts $line_top
                puts "\n#{$align}Unfortunately you just couldn't hack it".red
                puts "\n#{$align}in this zombie eat human world...".red
                puts "\n#{$align}Better luck next time!".red
                puts $line_bottom
                sleep 5
                Exit
                system('clear')



               else
                  $zombie[:hp] <= 0

                  break
            end
          if $zombie[:health] <= 0
            break
        end

        end
      end

      if $zombie[:health] <= 0
        break
      end
    end
  end
  $zombie[:hp] = 15
  $dmg_h = 0
  $dmg_z = 0
end

def sec_battle

  if $sec_battle_sprite >= 1
    loop do
      system('clear')
      zombie_graphic
      puts $line_bottom
      puts "#{$align}A rabid zombie scientist comes out of nowhere at you!".green
      puts $line_bottom


      input = ask "\n#{$align}What do you do? (run[r]), (fight[f]): ".green
      puts $line_bottom

      system('clear')

      case
      when input == "r"
        $run = rand $profile[:speed]
        if $run == 1
          break
        end
      when input == "f"
        loop do
          zombie_graphic
          puts $line_bottom
          inv_stats
          battle_data

          input = ask "\n#{$align} Hit zombie [h]:\n#{$align} Use bandaid[b]: ".green
          system('clear')
            case
               when input == "h"

                  $dmg_h = rand $profile[:weapon]..$profile[:attack]
                  $dmg_z = rand 7

                  $zombie[:health] -= $dmg_h

                  $profile[:health] -= $dmg_z
                when input == "b"
                  if $profile[:bandaid] >= 1

                      $profile[:bandaid] -= 1
                      $profile[:health] += 10
                      $dmg_z = rand 7

                      $zombie[:health] -= $dmg_h
                    else
                      puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                      puts "#{$center}#{$align}Oh shiiiieet! You ain't got any left...".yellow
                      sleep 2
                      system('clear')
                   end


                when $profile[:health] <= 0
                  system('clear')
                puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                puts $line_top
                puts "\n#{$align}Unfortunately you just couldn't hack it".red
                puts "\n#{$align}in this zombie eat human world...".red
                puts "\n#{$align}Better luck next time!".red
                puts $line_bottom
                sleep 5
                Exit
                system('clear')



               else
                  $zombie[:hp] <= 0

                  break
            end
          if $zombie[:health] <= 0
            break
        end

        end
      end

      if $zombie[:health] <= 0
        break
      end
    end

  end
  $zombie[:hp] = 15
  $dmg_h = 0
  $dmg_z = 0
  $sec_battle_sprite -= 1

end









$input = ""
system('clear')
# Room 1
loop do
  bandaid_use
  room_1
  menu_b
  room_1_i if $input == "i"
  nav_s

  puts $profile[:weapon]

  $input = ask("\n#{$align}#{decision} ").downcase
  system('clear')

  case
  when $input == 'i'

  when $input == 'h'
    $profile[:weapon] = $hammer
    $weapon = "Hammer (base damage:  #{$profile[:weapon]})"

    when south
        system('clear')
# Room 2
        loop do

          battle
          bandaid_use
          room_2
          room_1_i if $input == "i"
          menu_b
          nav_n
          nav_s
          nav_w




          $input = ask("\n#{$align}#{decision} ").downcase
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
                battle
                room_3
                bandaid_use
                room_3_i if $input == "i"
                menu_b
                nav_e
                # if $key_found = true
                #   puts "You found a key!"
                # end


                $input = ask("\n#{$align}#{decision} ").downcase
                system('clear')

                case
                 when $input == 'i'

                 when $input == 'l'
                   $key_found = true

                 when $input == 'c'
                    cry
                 when $input = 'e'
                    break
                end
              end


            when south
# Room 4
              loop do
                battle
                room_4
                bandaid_use
                room_1_i if $input == "i"
                menu_b
                nav_n
                nav_s

                $input = ask("\n#{$align}#{decision} ").downcase
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
                      battle
                      room_5
                      bandaid_use
                      room_1_i if $input == "i"
                      menu_b
                      nav_n
                      nav_e

                      $input = ask("\n#{$align}#{decision} ").downcase
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
                            battle
                            room_6
                            bandaid_use
                            room_6_i if $input == "i"
                            menu_b
                            nav_s
                            nav_e
                            nav_w

                            $input = ask("\n#{$align}#{decision} ").downcase
                            system('clear')

                            case
                              when $input == 'i'
                                $sec_lock_discover = true

                              when $input == 'c'
                              cry
                            when west
                              break

                            when east
# Room 7
                              if $sec_door_lock == true; loop do

                                $sec_battle_sprite = 3
                                if $sec_battle_sprite >= 1
                                  sec_battle
                                end

                                room_7
                                room_7_i if $input == "i"
                                menu_b
                                nav_w


                                $input = ask("\n#{$align}#{decision} ").downcase
                                system('clear')

                                case
                                    when $input == 'i'

                                    when $input == 'g'
                                      $profile[:weapon] = $gun
                                      $weapon = "Handgun (base damage:  #{$profile[:weapon]})"

                                    when west
                                      break

                                    when $input == 'c'
                                    cry
                                end
                              end
                            end


                            when south
# Room 8
                              if $key_found == true;  loop do
                                  room_8
                                  bandaid_use
                                  room_1_i if $input == "i"
                                  menu_b
                                  nav_n


                                  $input = ask("\n#{$align}#{decision} ").downcase
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

end
