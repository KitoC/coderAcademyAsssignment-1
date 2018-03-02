


# Graphics
def zombie (n)
  system('clear')
  puts $line_top
  puts " "*n + '                                .....            '.yellow
  puts " "*n + '                               C C  /            '.green
  puts " "*n + '                              /<   /             '.green
  puts " "*n + '               ___ __________'+'/_"'.green + '#'.red + "__=o             ".green
  puts " "*n + '               /(- /(\_'.green + '\________   \              '
  puts " "*n + '               \ ) \ )_'.green + '      \o     \             '
  puts " "*n + '               '+'/|\ /|\ '.green+'      |      |             '
  puts " "*n + '                             |     _|             '
  puts " "*n + '                             /o   __\             '
  puts " "*n + '                            /       |             '
  puts " "*n + '                           / /      |             '
  puts " "*n + '                          /_/\______|             '
  puts " "*n + '                         (   _(    <              '
  puts " "*n + '                          \    \    \             '
  puts " "*n + '                           \    \    |            '
  puts " "*n + '                            \____\____\           '
  puts " "*n + '                            ____\_\__\_\          '.yellow
  puts " "*n + '                          /`   /`     o\          '.yellow
  puts " "*n + '                          |___ |_______|'.yellow
  puts $line_bottom
end

def zombie_static (n)
  system('clear')
  puts $line_top
  puts " "*n + '                                .....            '.yellow
  puts " "*n + '                               C C  /            '.green
  puts " "*n + '                              /<   /             '.green
  puts " "*n + '               ___ __________'+'/_"'.green + '#'.red + "__=o             ".green
  puts " "*n + '               /(- /(\_'.green + '\________   \              '
  puts " "*n + '               \ ) \ )_'.green + '      \o     \             '
  puts " "*n + '               '+'/|\ /|\ '.green+'      |      |             '
  puts " "*n + '                             |     _|             '
  puts " "*n + '                             /o   __\             '
  puts " "*n + '                            /       |             '
  puts " "*n + '                           / /      |             '
  puts " "*n + '                          /_/\______|             '
  puts " "*n + '                         (   _(    <              '
  puts " "*n + '                          \    \    \             '
  puts " "*n + '                           \    \    |            '
  puts " "*n + '                            \____\____\           '
  puts " "*n + '                            ____\_\__\_\          '.yellow
  puts " "*n + '                          /`   /`     o\          '.yellow
  puts " "*n + '                          |___ |_______|'.yellow
  puts $line_bottom
end


def gems
  n = 33
  puts " "*n + " .     '     ,".white + " "*10 + " .     '     ,".white + " "*10 + " .     '     ,".white + " "*10 + " .     '     ,".white
  puts " "*n + "   _________".red + " "*12 + "   _________".blue + " "*12 + "   _________".yellow + " "*12 + "   _________".green
  puts " "*n + '_ /_|_____|_\ _'.red + " "*9 + '_ /_|_____|_\ _'.blue + " "*9 + '_ /_|_____|_\ _'.yellow + " "*9 + '_ /_|_____|_\ _'.green
  puts " "*n + '  ' + "''".red + '.\   /'.red + '.'.red + "''".red + " "*11 + '  ' + "''".blue + '.\   /'.blue + '.'.blue + "''".blue + " "*11 + '  ' + "''".yellow + '.\   /'.yellow + '.'.yellow + "''".yellow + " "*11 + '  ' + "''".green + '.\   /'.green + '.'.green + "''".green
  puts " "*n + "    '".red + '.\ /.'.red + "'".red + " "*13 + "    '".blue + '.\ /.'.blue + "'".blue + " "*13 + "    '".yellow + '.\ /.'.yellow + "'".yellow + " "*13 + "    '".green + '.\ /.'.green + "'".green
  puts " "*n + "      '.'".red + " "*15 + "      '.'".blue + " "*15 + "      '.'".yellow + " "*15 + "      '.'".green
end

def gem (gcolor)
  n = 69
  puts " "*n + " .     '     ,".white
  puts " "*n + "   _________".colorize(gcolor)
  puts " "*n + '_ /_|_____|_\ _'.colorize(gcolor)
  puts " "*n + '  ' + "''".colorize(gcolor) + '.\   /'.colorize(gcolor) + '.'.colorize(gcolor) + "''".colorize(gcolor)
  puts " "*n + "    '".colorize(gcolor) + '.\ /.'.colorize(gcolor) + "'".colorize(gcolor)
  puts " "*n + "      '.'".colorize(gcolor)
end

# blue = "blue"

# gem(:blue)
