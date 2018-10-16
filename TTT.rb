require_relative 'class/Board'       # On effectue le lien avec les fichiers de chaque Classe.
require_relative 'class/BoardCase'
require_relative 'class/Game'
require_relative 'class/Player'

game = Game.new                        # On crée une nouvelle partie.
game.go                                # On lance le jeu !!