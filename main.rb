require './players'
require './random_number'

$player1 = Players.new("Player1")
$player2 = Players.new("Player2")

def random_start
  guess = rand(1..2)
  guess == 1 ? $player1 : $player2
end

def life_update(current_player)
  current_player.name == $player1.name ? $player1.life = current_player.life : $player2.life = current_player.life
end

def switch_player(current_player)
  current_player.name == $player1.name ? $player2 : $player1
end

def turn(current_player)
  $random1 = RandomNumber.new
  $random2 = RandomNumber.new

  if (current_player.life == 0)
    current_player = switch_player(current_player)
    puts "#{current_player.name} wins with a score of #{current_player.life}/3" 
    puts "----- GAME OVER -----"
    exit(0)
  end

  puts "Hi #{current_player.name}, what does #{$random1.number} + #{$random2.number} equal?"
  print "> "
  total = $random1.number + $random2.number
  choice = $stdin.gets.chomp.to_i

  if (choice == total)
    puts "YES, you are correct!"
    puts ""
  elsif (choice != total)
    puts "Seriosly? No!"
    puts ""
    current_player.life -= 1
    life_update(current_player)
  end

  if (current_player.life == 0)
    current_player = switch_player(current_player)
    puts "#{current_player.name} wins with a score of #{current_player.life}/3" 
    puts "----- GAME OVER -----"
    exit(0)
  elsif
    puts "P1: #{$player1.life}/3 vs P2: #{$player2.life}/3"
  end

  current_player = switch_player(current_player)
  puts ""
  puts "-----NEW TURN-----"
  puts ""

  turn(current_player)
end

turn(random_start)
