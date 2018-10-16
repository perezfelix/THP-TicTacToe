class Board

  attr_accessor :cases, :choice

  def initialize               
  #Initialisation des 9 cases                                                     
    bc_1 = BoardCase.new(1, "1")
    bc_2 = BoardCase.new(2, "2")
    bc_3 = BoardCase.new(3, "3")
    bc_4 = BoardCase.new(4, "4")
    bc_5 = BoardCase.new(5, "5")
    bc_6 = BoardCase.new(6, "6")
    bc_7 = BoardCase.new(7, "7")
    bc_8 = BoardCase.new(8, "8")
    bc_9 = BoardCase.new(9, "9")
    #On les mets dans un Array
    @cases = [bc_1, bc_2, bc_3, bc_4, bc_5, bc_6, bc_7, bc_8, bc_9] 
   # @result = "         "
   #@player_won = "        "
  end
  def show
  puts "   ═════════════════════════╗"
  puts "  ╱                       ╱ ║"
  puts " ╱                       ╱  ║"
  puts "╔═══════╦═══════╦═══════╗   ║"
  puts "║       ║       ║       ║   ║"
  puts "║   #{@cases[0].value}   ║   #{@cases[1].value}   ║   #{@cases[2].value}   ║   ║"
  puts "║       ║       ║       ║   ║"
  puts "╠═══════╬═══════╬═══════╣   ║"
  puts "║       ║       ║       ║   ║"
  puts "║   #{@cases[3].value}   ║   #{@cases[4].value}   ║   #{@cases[5].value}   ║   ║"
  puts "║       ║       ║       ║   ║"
  puts "╠═══════╬═══════╬═══════╣   ║"
  puts "║       ║       ║       ║   ║"
  puts "║   #{@cases[6].value}   ║   #{@cases[7].value}   ║   #{@cases[8].value}   ║   ║"
  puts "║       ║       ║       ║   ║"
  puts "╠═══════╩═══════╩═══════╣   ║"
  puts "║ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ║   ║"
  puts "║ ★   ☄ TICTACTOE ☘   ★ ║  ╱"
  puts "║ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ║ ╱"
  puts "╚═══════════════════════╝"
  end
  def get_player_choice(choice, pmark, player)
  #prend le choix du joueur, et le met dans une methode qui défini la valeur de la case du board
  self.set_case_value(choice, pmark, player)
  end
  #Changement de la valeur de la case
  def set_case_value(choice, pmark, player)  
    if is_playable(@cases[choice-1])
      if pmark == "O"
        @cases[choice-1].value = "O"
      else
        @cases[choice-1].value = "X"
      end
    else
      # Appelle la fonction qui check si la case a déjà été modifiée
      puts "Déjà pris ! Essaye encore"                                             
      choice = (gets.chomp).to_i
      self.set_case_value(choice, pmark, player)
    end
  end
  def is_playable(cell)
    	#Est-ce que la case est jouable ? ( non prise )
   	if cell.value.to_i == cell.name
      return true
   	else
      return false
   	end
  end
  def victory(player)
    	#Paramètres de victoire
	   if @cases[0].value == @cases[1].value && @cases[1].value == @cases[2].value
	     return true

	   elsif @cases[3].value == @cases[4].value && @cases[4].value == @cases[5].value
	     return true

	   elsif @cases[6].value == @cases[7].value && @cases[7].value == @cases[8].value
	     return true

       elsif @cases[0].value == @cases[3].value && @cases[3].value == @cases[6].value
    	 return true

	   elsif @cases[1].value == @cases[4].value && @cases[4].value == @cases[7].value
	     return true

	   elsif @cases[2].value == @cases[5].value && @cases[5].value == @cases[8].value
	     return true

	   elsif @cases[2].value == @cases[4].value && @cases[4].value == @cases[6].value
	     return true

	   elsif @cases[0].value == @cases[4].value && @cases[4].value == @cases[8].value
	     return true
       end
  end
end