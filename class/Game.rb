class Game
  # Variable de classe qui permet de "casser" la loop si quelqu'un gagne
  @@victory = false                                                                         

  def initialize
   # Demande/assigne les paramètres aux joueurs                                                                           
    puts "Bienvenu dans le Tic-Tac-Toe !"
    @p_one = Player.new
    @p_one.infos
    @p_two = Player.new
    @p_two.infos
    @board_game = Board.new
  end
  def go      
    # Lancement du jeu                                                                              
    puts "Let's go !"
    i = 0
    loop do
      # On casse la loop à 9, car le board ne contient que 9 cases
      break if i > 8                                                                        
        # Appelle le tour du player 1
      self.turn(@p_one)                                                                     
      i +=1
        # Win du player 1, du coup on sort de la loop et on affiche le board
      if @@victory                                                                          
        puts "On a un gagnant !"
        @board_game.show
        puts "Bravo #{@p_one.pname} ٩(̾●̮̮̃̾•̃̾)۶ !"
        puts "#{@p_two.pname}, tu feras mieux la prochaine fois ٩(×̯×)۶"
        break
      end
      break if i > 8
        # Appelle le tour du player 2
      self.turn(@p_two)                                                                     
      i +=1
        # Win du player 2
      if @@victory                                                                          
        puts "On a un gagnant !"
        @board_game.show
        puts "Bravo #{@p_two.pname} ٩(̾●̮̮̃̾•̃̾)۶ !"
        puts "#{@p_one.pname}, tu feras mieux la prochaine fois ٩(×̯×)۶"
        break
      end
    end
	    # Montre le board une fois le jeu fini
	  ###@board_game.show
	    #Pas de victoire == egalité                                                                       
	  if @@victory == false
	  @player_won = "MATCH NUL"
	     # Affiche les points                                           
	  puts "#{@p_one.pname} : #{@p_one.ppoints} points VS #{@p_two.pname} : #{@p_two.ppoints} points"
	    #Try again
	  puts "Try again ? Y/N"                                                                  
	  choice = (gets.chomp).to_s.capitalize
	    # Si oui, clear du board + reset de la victoire
	   if choice == "Y"                                                                        
	    @@victory = false
	    @board_game = Board.new
	    self.go   # Relancement du jeu avec un board "propre" et les points gardés en mémoire
	   else choice == "N"
	    puts "Exiting"
      sleep(1)
      print "."
      sleep(1)
      print "." 
      sleep(1)
      puts "."
      puts "CYA !"                                                                             
	   end
   else @@victory == true
    puts "#{@p_one.pname} : #{@p_one.ppoints} points VS #{@p_two.pname} : #{@p_two.ppoints} points"
    puts "Voulez vous refaire une partie ? (Y/N)" 
    choice = (gets.chomp).to_s.capitalize
      # Si oui, clear du board + reset de la victoire
     if choice == "Y"                                                                        
      @@victory = false
      @board_game = Board.new
      self.go   # Relancement du jeu avec un board "propre" et les points gardés en mémoire
     else choice == "N"
      print "Exiting"
      sleep(1)
      print "."
      sleep(1)
      print "." 
      sleep(1)
      puts "."
      puts "CYA !"                                                                             
     end
    end
  end
    # Tour d'un joueur
  	def turn(player)                                                                          
	    @choice = 0
	    # Affiche la board
	    @board_game.show                                                                        
	    puts "A toi #{player.pname}"
	    puts "Place ton jeu dans une de ces cases (1 à 9)"
	    # Cree un intervale de choix entre 1 et 9 (9 cases)
	     while !((1..9).include?(@choice)) do                                                     
	        @choice = (gets.chomp).to_i
	     end
	    # Appel de la fonction qui modifie la case ( et check si c'est possible )
	    @board_game.get_player_choice(@choice, player.pmark, player)
	    #check si quelqu'un a gagner, si oui met Victoire en true et ajoute 1 point au joueur                           
	   	 if @board_game.victory(player)                                                           
	      @@victory = true
	      player.ppoints += 1
	   	 end
 	  end
end