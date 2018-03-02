require "highline/import"
require 'colorize'
require 'terminal-table'
require "win32/sound"
include Win32
require 'os'
require_relative 'graphics (1)'
require 'win32ole'
require 'win32-process'

#Formatting
alignment = ""
 $align = " ".ljust(50)
 $center = "\n"
 $map_align = " ".ljust(16)
 $line_top = "#{$center}#{$align}_____________________________________________________\n".red
 $line_bottom  ="#{$align}_____________________________________________________".red
 decision = "Make you decision (Don't f*** up!):".yellow

 def welcome
   system('clear')
   puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
   puts $line_top
   puts "#{$align}             Welcome to Zombie Ruby Run!!\n".bold.yellow
   puts "#{$align}Enter if you dare. This game is not for the faint of".green
   puts "#{$align}heart.  You will face some of the scariest monsters".green
   puts "#{$align}imaginable! Be warned, turn back before it's too late!".green
   puts $line_bottom
 end

 $profile = {
   name: "",
   attack: 5,
   speed: 5,
   speed_st: "Slow",
   health: 30,
   smell: 0,
   body_odor: "",
   weapon: 0,
   bandaid: 0
 }


 $speed_number = 0
 def speed
   if $speed_number == 0
     $profile[:speed] = 5
     $profile[:speed_st] = "Slow"
   elsif $speed_number == 1
     $profile[:speed] = 4
     $profile[:speed_st] = "Medium"
   elsif $speed_number == 2
     $profile[:speed] = 3
     $profile[:speed_st] = "Fast"
   elsif $speed_number == 3
     $profile[:speed] = 2
     $profile[:speed_st] = "Super Fast"

   end
 end


 $odor_number = 0
 def odor
   if $odor_number == 0
     $profile[:body_odor] = "sanitized."
     $profile[:smell] = 2
   elsif $odor_number == 1
     $profile[:body_odor] = "pretty bad..."
     $profile[:smell] = 3
   elsif $odor_number == 2
     n = 35
     $profile[:body_odor] = "like death!"
     $profile[:smell] = 4
   end
 end


 def stats
   system('clear')
   n = 35
   puts $line_top
   puts "#{$align}                  Zombie Ruby Run\n".bold.yellow
   puts "#{$align}" + "Character Name: #{$profile[:name]}".ljust(n).green + "Attack: #{$profile[:attack]}".red
   puts "#{$align}" + "Height: #{$height}".ljust(n).green + "Speed: #{$profile[:speed_st]}".red
   puts "#{$align}" + "Hair Length: #{$hair}".ljust(n).green + "Health: #{$profile[:health]}".red
   puts "#{$align}" + "Clothes: #{$clothes_on}".ljust(n).green
   puts "\n#{$align}You smell #{$profile[:body_odor]}".yellow
   puts "\n#{$align}" + "Coin: #{$flip}".ljust(n).green + "Gem: #{$gem}".red
   puts $line_bottom
 end

 # Line Bars
 def line_bar
   stats
   puts $line_bottom
   puts "#{$align}Your character needs a name."
   $name = ask("\n#{$align}Character name: ").capitalize
   $profile[:name] = $name
 end
 def line_bar_name
   stats
   puts "\n#{$align}                     Nice name!\n".bold.yellow
   puts $line_bottom

 end
 def line_bar_height
   stats
   puts "\n#{$align}         #{$size}\n".bold.yellow
   puts $line_bottom
 end
 def line_hair_length
   stats
   puts "#{$align}              #{$hair_style}".bold.yellow

   puts $line_bottom
 end
 def line_bar_clothes
   stats
   puts "\n#{$align}   #{$clothes_bar}".bold.yellow

   puts $line_bottom
 end
 def line_bar_flip
   stats
   puts "\n#{$align}         #{$heads}#{$tails}\n".bold.yellow
   puts $line_bottom
 end
 def line_bar_gems
   stats
   gems
   puts $line_bottom
 end
 def line_bar_gem_red
   stats
   gem(:red)
   puts "\n#{$align}       Attack: +2 | Health: -3 | Bandaids: +1".bold.yellow
   puts $line_bottom
 end
 def line_bar_gem_blue
   stats
   gem(:blue)
   puts "\n#{$align}       Attack: +0 | Health: +10 | Bandaids: +0\n".bold.yellow
   puts $line_bottom
 end
 def line_bar_gem_yellow
   stats
   gem(:yellow)
   puts "\n#{$align}       Attack: +1 | Health: -5 | Bandaids: +2".bold.yellow
   puts $line_bottom
 end
 def line_bar_gem_green
   stats
   gem(:green)
   puts "\n#{$align}       Attack: -1 | Health: -5 | Bandaids: +3".bold.yellow
   puts $line_bottom
 end

 def line_bar_enter_game
   stats
   puts "#{$align}          Get ready to enter the game.\n".bold.yellow
   puts $line_bottom
 end

 def line_bar_gems_invalid
   stats
   gems
   puts "\n#{$align}          Invalid entry. You must Choose!!".bold.yellow
   puts $line_bottom
 end
 def line_bar_invalid
   stats
   puts "#{$align}          Invalid entry. Try again.\n".bold.yellow
   puts $line_bottom
 end


 def height_stats
   line_bar_name #line with "nice name" in it
   loop do
     $height = ask("\n#{$align}What is your height? (Tall, Short, Average) ").capitalize
     if $height == "Tall"
       $profile[:attack] += 2
       $size = "Attack: +2 | Speed: +0 | Health: +0"
       $height = "Tall"
       speed
       break
     elsif $height == "Short"
       $speed_number += 1
       speed
       $size = "Attack: +0 | Speed: +1 | Health: +0"
       $height = "Short"
       break
     elsif $height == "Average"
       $profile[:health] += 10
       $size = "Attack: +0 | Speed: +0 | Health: +10"
       $height = "Average"
       speed
       break
     else
       $height = ""
       line_bar_invalid
     end
   end
 end
 def hair_length
   line_bar_height
   loop do
     puts "\n#{$align}The longer your hair, the harder it is for \n#{$align}you to get away from zombies.\n".bold.green
     puts "#{$align}The smellier you are, the harder it is for \n#{$align}the zombies to find you!\n".bold.green
     $hair = ask("\n#{$align}What is your hair length? (Long or Short) ").capitalize
     if $hair == "Short"
       $speed_number += 1
       speed
       odor
       $hair_style = "Speed: +1 | Body Odor: +0"
       break
     elsif $hair == "Long"
       # $profile[:speed] -= 1
       $odor_number += 1
       odor
       $hair_style = "Speed: +0 | Body Odor: +1"
       break
     else
       $hair = ""
       line_bar_invalid
     end
   end
 end
 def clothes_style
   line_hair_length
   loop do
     puts "\n#{$align}The looser your clothes, the harder it is \n#{$align}for you to get away from zombies.\n".bold.green
     puts "#{$align}The smellier you are, the harder it is \n#{$align}for the zombies to find you!\n".bold.green

     puts "\n#{$align}What would you like to wear?".green
     puts "#{$align}New fitted clothes:[1]".yellow
     puts "#{$align}Tattered rags:[2]".yellow

     $clothes = ask("\n#{$align}Choose your threads: ").to_i
     if $clothes == 1
       $speed_number += 1
       speed
       $clothes_on = "New fitted clothes"
       $clothes_bar = "New fitted clothes | Speed: +1 | Body Odor: +0"
       break
     elsif $clothes == 2
       # $profile[:speed] -= 3
       $odor_number += 1
       odor
       $clothes_on = "Tattered rags"
       $clothes_bar = "Tattered rags | Speed: +0 | Body Odor: +1"
       break
     else
     line_bar_invalid
     $clothes_on = ""
     end
   end
 end
 def coin_flip
   line_bar_clothes
   $coin = ask("\n#{$align}Flip a coin: Heads or Tails? ").capitalize
   side = rand 2
   if $coin ["Head"] && side == 1
     $profile[:attack] += 2
     $profile[:health] += 5
     $heads = "It was Heads! Attack: +2 | Health: +5"
     $tails = ""
     $flip = "Won"
   elsif $coin ["Tail"] && side == 1
     $profile[:attack] += 2
     $profile[:health] += 5
     $tails = "It was Tails! Attack: +2 | Health: +5"
     $heads = ""
     $flip = "Won!"
   else
     $profile[:attack] -= 1
     $profile[:health] -= 2
     $heads = "You chose wrong! Attack: -1 | Health: -2"

     $flip = "Lost =["
   end
 end
 def gem_stats
   line_bar_gems
   loop do
     $gem = ask("\n#{$align}Choose a gem. (Red, Blue, Yellow, Green): ").capitalize
     if $gem ["Red"]
       $profile[:attack] += 2
       $profile[:health] -= 3
       $profile[:bandaid] += 1
       line_bar_gem_red
       sleep 3
       break
     elsif $gem ["Blue"]
       $profile[:attack] += 0
       $profile[:health] += 10
       line_bar_gem_blue
       sleep 3
       break
     elsif $gem ["Yellow"]
       $profile[:attack] += 1
       $profile[:health] -= 5
       $profile[:bandaid] += 2
       line_bar_gem_yellow
       sleep 3
       break
     elsif $gem ["Green"]
       $profile[:attack] -= 1
       $profile[:health] -= 5
       $profile[:bandaid] += 3
       line_bar_gem_green
       sleep 3
       break
     else
       line_bar_gems_invalid
       $gem = ""
     end
   end
 end


def gem_flash
  system('clear')
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  sleep 0.8
  system('clear')
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  system('clear')
  sleep 0.5
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  sleep 0.3
  system('clear')
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  system('clear')
  sleep 0.3
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  system('clear')
  sleep 0.3
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  sleep 0.2
  system('clear')
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:green)
  sleep 0.5
  system('clear')
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  gem(:red)
  sleep 1
end


 # Everything starts here

gem_flash

 if OS.mac?
   pid = fork{ exec 'afplay', "Blackthorne.mp3" }
 end
 # Home Screen Start
 welcome
 sleep 3
 if OS.mac?
 pid = fork{ exec 'afplay', "scream.mp3" }
 end


 system('clear')
 welcome
 sleep 1.5

 zombie (80)
 sleep 0.3
 welcome
 sleep 0.2
 zombie (42)
 sleep 0.2
 welcome
 sleep 0.2
 zombie (10)
 sleep 1
 welcome
 sleep 3
 # Home Screen End


 # Ask for character name
 line_bar

 #Ask for height
 height_stats

 # Asks for hair length
 hair_length

 #asks for clothes
 clothes_style


 # Ask for Heads or tails
 coin_flip




 # Dispay coin flip results

 line_bar_flip
 sleep 1

 gem_stats


 if OS.mac?
  pid = fork{ exec 'killall afplay'}
 end

 line_bar_enter_game


 if OS.mac?
   pid = fork{ exec 'afplay', "Blackthorne2.mp3" }
 end
 sleep 2

 $dmg_h = 0
 $dmg_z = 0
 $sprite = 0
 $sec_door_lock = false
 $sec_lock_discover = false
 $key_found = false
 $eyeball = false


 def inv_stats
  puts "#{$align}#{$profile[:name]}'s Health:".green + " #{$profile[:health]}".white + " Attack:".green + " #{$profile[:attack]}".white + " Speed:".green + " #{$profile[:speed]}".white + " Bandaids:".green + " #{$profile[:bandaid]}".white
  puts "\n#{$align}Weapon:".green + " #{$weapon}\n".yellow
  puts "#{$align}You smell #{$profile[:body_odor]}\n".green
  if $key_found == true
    puts "#{$align}Key added to inventory."
  end
  if $eyeball == true
    puts "#{$align}Eyeball added to inventory."
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
  if $profile[:weapon] != 3
    puts "#{$align}There is hammer in here! (equip hammer [h])"
  end
  if $profile[:weapon] == 3
    puts "#{$align}You already searched here ya big dumb dumb!"
  end
  if $sec_lock_discover == true;  puts "#{$align}The code is #{"0 4 3 2".red}"
     $sec_door_lock = true
  end

  puts $line_bottom
 end
 def room_2_i
  if $f_bandaid[:room2] != 0
    puts "#{$align}You check the pot plant and find"
    puts "#{$align}an eyeball and two bandaids (takem' [gb])"
  end
  if $f_bandaid[:room2] == 0
    puts "#{$align}You already searched here ya big dumb dumb!"
  end
  puts $line_bottom
 end
 def room_3_i
   if $f_bandaid[:room3] != 0
     puts "#{$align}You check the desk drawers and find three bandaids (takem' [gb])"
   end
   if $f_bandaid[:room3] == 0
     puts "#{$align}You already searched here ya big dumb dumb!"
   end
   if $key_found == false
     puts "#{$align}There is a dead body behind the desk (loot [l])"
   end
  puts $line_bottom
 end
 def room_4_i
   if $f_bandaid[:room4] != 0
     puts "#{$align}You notice someone has stuck two bandaids"
     puts "#{$align}to Mona Lisa's eyes (takem' [gb])"
   end
   if $f_bandaid[:room4] == 0
     puts "#{$align}You already searched here ya big dumb dumb!"
   end
  puts $line_bottom
 end
 def room_5_i
   if $f_bandaid[:room5] != 0
     puts "#{$align}On closer inspection, you find two bandaids"
     puts "#{$align}in the sandwich... TWO?! YUCK!!! (takem' [gb])"
   end
   if $f_bandaid[:room5] == 0
     puts "#{$align}You already searched here ya big dumb dumb!"
   end
  puts $line_bottom
 end
 def room_6_i
  puts "#{$align}The security room door needs a code!"
  puts "#{$align}The lobby door needs a key!"

  puts $line_bottom
 end
 def room_7_i
   if $profile[:weapon] != 8
     puts "#{$align}There is an axe in here (equip axe [a])"
   end

   if $f_bandaid[:room5] != 0
     puts "#{$align}On the handle of the axe you "
     puts "#{$align}find three bandaids (takem' [gb])"
   end
   if $f_bandaid[:room5] == 0
     puts "#{$align}You already searched here ya big dumb dumb!"
   end
   puts $line_bottom
 end
 def room_8_i
  puts "#{$align}"
  puts $line_bottom
 end



def map(room1, room2, room3, room4, room5, room6, room7, room8)
   puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green
   puts "#{$align}#{$map_align}     | ".green + "#{room1}".white + " |".green
   puts "#{$align}#{$map_align} +—".green + "—".green + "—".green+"+—".green + "—".red + "—+".green
   puts "#{$align}#{$map_align} | ".green + "#{room3}".white + " | ".red + "#{room2}".white + " |".green
   puts "#{$align}#{$map_align} +—".green + "—".green + "—+".green+"—".green + "—".red + "—+".green
   puts "#{$align}#{$map_align}     | ".green + "#{room4}".white + " |".green
   puts "#{$align}#{$map_align}     +—".green + "—".red + "—+".green + "—".green + "—".green + "—+".green+ "—".green + "—".green + "—+".green
   puts "#{$align}#{$map_align}     | ".green + "#{room5}".white + " | ".red + "#{room6}".white + " | ".red + "#{room7}".white + " |".green
   puts "#{$align}#{$map_align}     +—".green + "—".green + "—+".green + "—".green + "—".red + "—+".green+ "—".green + "—".green + "—+".green
   puts "#{$align}#{$map_align}         | ".green + "#{room8}".white + " |".green
   puts "#{$align}#{$map_align}         +—".green + "—".red + "—+".green
end


 def room_1
  puts $line_top
  puts "#{$align}                      Room 1\n".bold.yellow
  puts "#{$align}You have awoken in a room with blood spattered walls.".green
  puts "#{$align}You notice someone has written some numbers in blood\n#{$align}on one of the walls.".red
  puts "#{$align}You hear moaning in the room next to you.\n".green
  map("x"," ", " ", " ", " ", " ", " ", " ")
    puts "#{$align}There is one door out.\n".blue
    puts $line_bottom
 end
 def room_2
    puts $line_top
    puts "#{$align}                      Room 2\n".yellow
    puts "#{$align}Just a boring old room with some dismembered limbs.".green
    puts "#{$align}One of the arms has a watch on it.\n#{$align}You wonder what time it is, but don't wanna touch it.".green
    puts "#{$align}Oh look, a pot plant.\n".green
    map(" ", "x", " ", " ", " ", " ", " ", " ")
    puts "#{$align}There are 3 doors out.\n".blue
    puts $line_bottom
 end
 def room_3
      puts $line_top
      puts "#{$align}                      Room 3\n".yellow
      puts "#{$align}You walk into an office and spot a bloated dead body".green
      puts "#{$align}behind the desk. Its your old boss! He got what he\n#{$align}deserved".green
      map(" "," ", "x", " ", " ", " ", " ", " ")
      puts "#{$align}There is 1 door out.\n".blue
  puts $line_bottom
 end
 def room_4
    puts $line_top
    puts "#{$align}                      Room 4\n".yellow
    puts "#{$align}You walk into a hallway lined with paintings. ".green
    puts "#{$align}You were never very fond of the art.\n#{$align}The splatters of blood have actually improved them.".green
    map(" "," ", " ", "X", " ", " ", " ", " ")
  puts $line_bottom
 end
 def room_5
    puts $line_top
    puts "#{$align}                      Room 5\n".yellow
    puts "#{$align}You walk into a room that looks like a cafeteria.".green
    puts "#{$align}Tables and chairs have been upturned.\n#{$align}There's a sandwich on the table closest to you.".green
    puts "#{$align}Looks like tuna fish, or maybe it's brains.\n".green
    map(" "," ", " ", " ", "x", " ", " ", " ")
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
  map(" "," ", " ", " ", " ", "x", " ", " ")
  puts "#{$align}There are 3 doors out.\n".blue
  puts $line_bottom
 end
 def room_7
  puts $line_top
  puts "#{$align}                      Room 7\n".yellow
  puts "#{$align}You walk into the security room and spot Frank dead ".green
  puts "#{$align}in his swivel chair. Poor Frank. You notice a donut\n#{$align}still in his hand. At least he died doing what he loved most.".green
  map(" "," ", " ", " ", " ", " ", "x", " ")
  puts "#{$align}There is 1 door out.\n".blue
  puts $line_bottom
 end
 def room_8
    puts $line_top
    puts "#{$align}                      Room 8\n".yellow
    puts "#{$align}Free at last! Man, you have really worked up and appitite".green
    puts "#{$align}You should have grabbed the tuna fish sandwish while you\n#{$align}had the chance. You wonder if KFC is open.".green
    map(" "," ", " ", " ", " ", " ", " ", "x")
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


 def zombie_graphic_sound(zg)
    zombie (62)
    zombie_b_screen(zg)
    if OS.windows?
      Sound.play("z-brain.wav")
    elsif OS.mac?
      pid = fork{ exec 'afplay', "z-brain.mp3" }
    end
    sleep 0.3
    zombie (52)
    zombie_b_screen(zg)
    sleep 0.3
    zombie_static (62)
    zombie_b_screen(zg)
   end
 def zombie_graphic(zg)
      zombie (62)
      zombie_b_screen(zg)
      sleep 0.3
      zombie (52)
      zombie_b_screen(zg)
      sleep 0.3
      zombie_static (62)
      zombie_b_screen(zg)
     end

 def zombie_b_screen(zf)
   puts "\n#{$align}#{zf[:name]} attacks you!".green
   puts $line_bottom
   inv_stats
   puts $line_bottom
 end


 def battle_data(type)

  # puts $line_bottom

  if $input == "h" && $dmg_h == 0
    if OS.windows?
      Sound.play("miss.wav")
    elsif OS.mac?
      pid = fork{ exec 'afplay', "miss.mp3" }
    end
    print "#{$align}Zombies health: #{type[:health].to_s.red}hp. ".green
    sleep 0.5
    puts "You missed!\n".yellow
  end

  if $input == "h" && $dmg_h > 0
    if OS.windows?
      Sound.play("z-hit.wav")
    elsif OS.mac?
      pid = fork{ exec 'afplay', "z-hit.mp3" }
    end
    print "#{$align}Zombies health: #{type[:health].to_s.red}hp. ".green
    sleep 0.5
    puts "You hit the zombie for: #{$dmg_h.to_s.red} dmg.\n".red
  end


  if ($input == "h" or $input == "r") && $dmg_z == 0
    if OS.windows?
      Sound.play("miss.wav")
    elsif OS.mac?
      pid = fork{ exec 'afplay', "miss.mp3" }
    end
    print "#{$align}Your health: #{$profile[:health].to_s.red}hp. ".green
    sleep 0.5
    puts "The zombie missed you!".yellow
  end

  if ($input == "h" or $input == "r") && $dmg_z > 0
    if OS.windows?
      Sound.play("h-hit.wav")
    elsif OS.mac?
      pid = fork{ exec 'afplay', "h-hit.mp3" }
    end
    print "#{$align}Your health: #{$profile[:health].to_s.red}hp. ".green
    sleep 0.5
    puts "The zombies hits you for: #{$dmg_z.to_s.red} dmg.".red
  end

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
 $axe = 8

 $zombie = {name: "A rabid zombie scientist comes out of nowhere and", health: 20, attack: 6}
 $sec_zombie = {name: "Frank gets out of the chair and", health: 40, attack: 10, sprite: 1}
 $boss_zombie = {name: "A big mother funkin BOSS zombie", health: 80, attack: 15, sprite: 1}

 $weapon = "Bare bloody fists (base damage:  #{$profile[:weapon]})"

 $f_bandaid_one = 1
 $f_bandaid_two = 2
 $f_bandaid_three = 3
 $f_bandaid = {room1: 0, room2: 2, room3: 3, room4: 1, room5: 2, room6: 0, room7: 3, room8: 0}



 $sec_battle_sprite = 1
 $boss_battle_sprite = 1

 def battle(zombie_f)
  $sprite = rand $profile[:smell]
  if $sprite == 1
    zombie_graphic_sound(zombie_f)
    loop do
      zombie_graphic(zombie_f)
      battle_data(zombie_f)



      # system('clear')


      $input = " "

      puts "\n#{$align}Hit zombie [h]:\n#{$align}Use bandaid [b]:\n#{$align}Run[r]: ".green
      $input = ask "#{$align}What do you do? ".yellow
      system('clear')

        case
            when $input == "h"

                  $dmg_h = rand $profile[:weapon]..$profile[:attack]
                  $dmg_z = rand zombie_f[:attack]

                  zombie_f[:health] -= $dmg_h
                  $profile[:health] -= $dmg_z
                  # $input = " "

                  if
                       zombie_f[:health] <= 0
                       if OS.windows?
                         Sound.play("z-death.wav")
                       elsif OS.mac?
                         pid = fork{ exec 'afplay', "z-death.mp3" }
                       end
                       break
                  end

                  if $profile[:health] <= 0
                    system('clear')
                    puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                    if OS.windows?
                      Sound.play("h-die.wav")
                    elsif OS.mac?
                      pid = fork{ exec 'afplay', "h-die.mp3" }
                    end
                    puts $line_top
                    puts "\n#{$align}Unfortunately you just couldn't hack it".red
                    puts "\n#{$align}in this zombie eat human world...".red
                    puts "\n#{$align}Better luck next time!".red
                    puts $line_bottom
                    sleep 5
                    Exit
                    system('clear')
                  end

              when $input == "b"
                  if $profile[:bandaid] >= 1

                      $profile[:bandaid] -= 1
                      $profile[:health] += 10
                      $dmg_z = zombie_f[:attack]

                      $profile[:health] -= $dmg_z

                    elsif $profile[:health] <= 0
                      system('clear')
                      puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                      if OS.windows?
                        Sound.play("h-die.wav")
                      elsif OS.mac?
                        pid = fork{ exec 'afplay', "h-die.mp3" }
                      end
                      puts $line_top
                      puts "\n#{$align}Unfortunately you just couldn't hack it".red
                      puts "\n#{$align}in this zombie eat human world...".red
                      puts "\n#{$align}Better luck next time!".red
                      puts $line_bottom
                      sleep 5
                      Exit
                      system('clear')

                    else
                      puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                      puts "#{$center}#{$align}Oh shiiiieet! You ain't got any left...".yellow
                      sleep 2
                      system('clear')

                   end

              when $input == "r"
                 $run = rand $profile[:speed]
                 $dmg_z = rand zombie_f[:attack]
                 $profile[:health] -= $dmg_z
                 # $input = " "

                 if $profile[:health] <= 0
                   system('clear')
                   puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                   if OS.windows?
                     Sound.play("h-die.wav")
                   elsif OS.mac?
                     pid = fork{ exec 'afplay', "h-die.mp3" }
                   end
                   puts $line_top
                   puts "\n#{$align}Unfortunately you just couldn't hack it".red
                   puts "\n#{$align}in this zombie eat human world...".red
                   puts "\n#{$align}Better luck next time!".red
                   puts $line_bottom
                   sleep 5
                   Exit
                   system('clear')
                 end


                 if $run == 1
                   break
                 end

                # else zombie_f[:health] <= 0
                #   break
        end
    end
    end
    zombie_f[:health] = 20
    $dmg_h = 0
    $dmg_z = 0
  end
  # $battle_start = false

 def battle2(zombie_f)
   zombie_graphic_sound(zombie_f)
     loop do
       zombie_graphic(zombie_f)
       battle_data(zombie_f)



       # system('clear')


       $input = " "

       puts "\n#{$align}Hit zombie [h]:\n#{$align}Use bandaid [b]:\n#{$align}Run[r]: ".green
       $input = ask "#{$align}What do you do? ".yellow
       system('clear')

         case
             when $input == "h"

                   $dmg_h = rand $profile[:weapon]..$profile[:attack]
                   $dmg_z = rand zombie_f[:attack]

                   zombie_f[:health] -= $dmg_h
                   $profile[:health] -= $dmg_z
                   # $input = " "

                   if
                        zombie_f[:health] <= 0
                        if OS.windows?
                          Sound.play("z-death.wav")
                        elsif OS.mac?
                          pid = fork{ exec 'afplay', "z-death.mp3" }
                        end
                        break
                   end

                   if $profile[:health] <= 0
                     system('clear')
                     if OS.windows?
                       Sound.play("h-die.wav")
                     elsif OS.mac?
                       pid = fork{ exec 'afplay', "h-die.mp3" }
                     end
                     puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                     puts $line_top
                     puts "\n#{$align}Unfortunately you just couldn't hack it".red
                     puts "\n#{$align}in this zombie eat human world...".red
                     puts "\n#{$align}Better luck next time!".red
                     puts $line_bottom
                     sleep 5
                     Exit
                     system('clear')
                   end

               when $input == "b"
                   if $profile[:bandaid] >= 1

                       $profile[:bandaid] -= 1
                       $profile[:health] += 10
                       $dmg_z = zombie_f[:attack]

                       $profile[:health] -= $dmg_z

                     elsif $profile[:health] <= 0
                       system('clear')
                       if OS.windows?
                         Sound.play("h-die.wav")
                       elsif OS.mac?
                         pid = fork{ exec 'afplay', "h-die.mp3" }
                       end
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
                       puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                       puts "#{$center}#{$align}Oh shiiiieet! You ain't got any left...".yellow
                       sleep 2
                       system('clear')

                    end

               when $input == "r"
                  $run = rand $profile[:speed]
                  $dmg_z = rand zombie_f[:attack]
                  $profile[:health] -= $dmg_z
                  # $input = " "

                  if $profile[:health] <= 0
                    system('clear')
                    if OS.windows?
                      Sound.play("h-die.wav")
                    elsif OS.mac?
                      pid = fork{ exec 'afplay', "h-die.mp3" }
                    end
                    puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                    puts $line_top
                    puts "\n#{$align}Unfortunately you just couldn't hack it".red
                    puts "\n#{$align}in this zombie eat human world...".red
                    puts "\n#{$align}Better luck next time!".red
                    puts $line_bottom
                    sleep 5
                    Exit
                    system('clear')
                  end


                  if $run == 1
                    break
                  end

                 # else zombie_f[:health] <= 0
                 #   break
         end
     end
     zombie_f[:sprite] -= 1
     zombie_f[:health] = 20
     $dmg_h = 0
     $dmg_z = 0
   end

   # $battle_start = false





 $input = ""
 system('clear')
 # Room 1
 loop do
  bandaid_use
  room_1
  room_1_i if $input == "i"
  menu_b
  nav_s


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

          battle($zombie)
          bandaid_use
          room_2
          room_2_i if $input == "i"
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

          when $input == 'gb'
            $profile[:bandaid] += $f_bandaid[:room2]
            $f_bandaid[:room2] = 0
            $eyeball = true


          when $input == 'c'
          cry

            when west
 # Room 3
              loop do
                battle($zombie)
                room_3
                bandaid_use
                room_3_i if $input == "i"
                menu_b
                nav_e



                $input = ask("\n#{$align}#{decision} ").downcase
                system('clear')

                case
                 when $input == 'i'

                 when $input == 'l'
                   $key_found = true

                 when $input == 'gb'
                   $profile[:bandaid] += $f_bandaid[:room3]
                   $f_bandaid[:room3] = 0

                 when $input == 'c'
                    cry
                 when $input = 'e'
                    break
                end
              end


            when south
 # Room 4
              loop do
                battle($zombie)
                room_4
                bandaid_use
                room_4_i if $input == "i"
                menu_b
                nav_n
                nav_s

                $input = ask("\n#{$align}#{decision} ").downcase
                system('clear')

                case
                 when $input == 'i'
                 when north
                   break

                 when $input == 'gb'
                   $profile[:bandaid] += $f_bandaid[:room4]
                   $f_bandaid[:room4] = 0

                 when $input == 'c'
                 cry

                 when south
 #room 5
                    loop do
                      battle($zombie)
                      room_5
                      bandaid_use
                      room_5_i if $input == "i"
                      menu_b
                      nav_n
                      nav_e

                      $input = ask("\n#{$align}#{decision} ").downcase
                      system('clear')

                      case
                       when $input == 'i'

                       when $input == 'gb'
                         $profile[:bandaid] += $f_bandaid[:room5]
                         $f_bandaid[:room5] = 0

                       when north
                         break

                       when $input == 'c'
                       cry

                     when east
 # room 6
                          loop do
                            battle($zombie)
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




                                room_7
                                room_7_i if $input == "i"
                                menu_b
                                nav_w

                                sleep 3
                                battle2($sec_zombie)


                                $input = ask("\n#{$align}#{decision} ").downcase
                                system('clear')

                                case
                                    when $input == 'i'

                                    when $input == 'gb'
                                      $profile[:bandaid] += $f_bandaid[:room7]
                                      $f_bandaid[:room7] = 0

                                    when $input == 'g'
                                      $profile[:weapon] = $axe
                                      $weapon = "Axe (base damage:  #{$profile[:weapon]})"

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
                                  battle2($boss_zombie)
                                  room_8
                                  bandaid_use
                                  room_8_i if $input == "i"
                                  menu_b
                                  nav_n
                                  nav_s


                                  $input = ask("\n#{$align}#{decision} ").downcase
                                  system('clear')

                                  case
                                      when $input == 'i'

                                      when north
                                        break

                                      when south
                                        loop do
                                          system('clear')
                                          puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                                          puts $line_top
                                          puts "\n#{$align}WOW! You actually made it out of this shit-fight.".red
                                          puts "\n#{$align}Now you can go and start a family,".red
                                          puts "\n#{$align}or something...".red
                                          puts $line_bottom
                                          sleep 3
                                          if OS.windows?
                                          Sound.play("scream.wav")
                                          elsif OS.mac?
                                          pid = fork{ exec 'afplay', "scream.mp3" }
                                          end
                                          sleep 0.6
                                          zombie1
                                          sleep 0.3
                                          # welcome
                                          # sleep 0.2
                                          zombie2
                                          sleep 0.2
                                          # welcome
                                          # sleep 0.2
                                          zombie3
                                          sleep 0.2
                                          system('clear')
                                          puts "\n\n\n\n\n\n\n\n\n\n\n\n"
                                          puts $line_top
                                          puts "\n#{$align}Maybe not...".red
                                          puts $line_bottom
                                          sleep 2
                                          Exit
                                          system('clear')

                                        end

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




 # pid = fork{ exec 'killall afplay'}
