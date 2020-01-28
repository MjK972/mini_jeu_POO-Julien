require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def fight (player1, player2)

    # Les attaques continuent si le style 2 utilisateurs a un point de vie tandis que player1.life_points> 0 && player2.life_points> 0
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state

    # Attaque avec le joueur1 (début du joueur1)
    puts "Passons à la phase d'attaque pour #{player1.name} :"
    player1.attacks (player2)

    # Si le joueur 2 est mort avec l'attaque du joueur 1, alors que la boucle s'arrête
    if player2.life_points <= 0
      break
    end

    # Attaque avec le joueur2
    puts "Passons à la phase d'attaque pour #{player2.name} :"
    player2.attacks (player1)

    # Si le joueur 1 est mort avec l'attaque du joueur 2, alors que la boucle s'arrête
    if player2.life_points <= 0
      break
    end
    puts "\n"
    puts "------------"
    puts "\n"
  end
end

def perform
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  fight(player1, player2)
end

perform
