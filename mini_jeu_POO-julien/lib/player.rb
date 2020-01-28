
class Player
  attr_accessor :name, :life_points

  # Initialisez un nouveau joueur avec son nom et 10 points de vie
  def initialize (name)
    @name = name
    @life_points = 10
  end

  # Afficher le point de vie de l'utilisateur actuel
  def show_state
    if @life_points <= 0
      puts ">>> #{@name} a 0 points de vie"
    else
      puts ">>> #{@name} a #{@life_points} points de vie"
    end
  end

  # Dommages à l'utilisateur actuel
  def gets_damage(damage)
    @life_points = @life_points - damage

    # Si l'utilisateur a 0 point de vie, il affiche un message qu'il perd
    if @life_points <= 0
      puts "\n"
      puts "----- La partie est finie #{self.name} a perdu ! -----"
    end
  end

  # Donner des attaques du joueur actuel à un autre (dans l'argument "joueur")
  def attacks (player)
    damage = compute_damage

    puts ">>> Le joueur #{self.name} attaque le joueur #{player.name}"

    puts ">>> Il lui inflige #{damage} points de dommages"

    # Donner des dommages au "joueur" dans l'argument
    player.gets_damage(damage)
  end

  # Donner un nombre aléatoire à utiliser dans la fonction gets_damage
  def compute_damage
    rand(1..6)
  end
end



class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :compute_damage_rand

  def initialize (name)
    super(name)

    @life_points = 100
    @weapon_level = 1
  end

  # Afficher le point de vie et le niveau d'arme de l'utilisateur actuel
  def show_state
    if @life_points <= 0
      puts ">>> #{@name} a 0 points de vie"
    else
      puts ">>> #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
  end

  # Inflige des dégâts aux ennemis
  def compute_damage
    super * @weapon_level
  end

  # Obtenez une nouvelle arme
  def search_weapon
    new_weapon = rand(1..6)
    puts ">>> Tu as trouvé une arme de niveau #{new_weapon}"

    # Obtenez une valeur aléatoire pour l'arme. Si l'arme réelle a plus de puissance, conservez la valeur
    # s'il est inférieur, il change la valeur à la meilleure valeur d'arme
    if new_weapon > @weapon_level
      puts ">>> Cette arme est plus puissante !"
      @weapon_level = new_weapon
    else
      puts ">>> Cette arme est moins puissante !"
    end
  end

  # Obtenez un pack de santé pour les points de vie des utilisateurs
  def search_health_pack
    new_health_pack = rand(1..6)

    if new_health_pack == 1
      puts ">>> Tu n'as rien trouvé..."

    elsif new_health_pack >= 2 && new_health_pack <= 5
      puts ">>> Bravo, tu as trouvé un pack de +50 points de vie !"

      # S'il obtient +50 points et que la valeur est> = 50, il renvoie 100 points
      if @life_points >= 50
        @life_points = 100
      # S'il obtient un pack de +50 points et une valeur <50, il renvoie les points de vie réels + 50 points
      else
        @life_points = @life_points + 50
      end
    # Identique au pack +50 points
    else
      puts ">>> Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points >= 20
        @life_points = 100
      else
        @life_points = @life_points + 80
      end
    end
  end
end
