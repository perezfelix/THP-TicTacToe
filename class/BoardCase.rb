class BoardCase
#Initialise au lancement du jeu
  attr_accessor :name, :value

  def initialize(name, value)
    @name = name.to_i
    @value = value
  end

end