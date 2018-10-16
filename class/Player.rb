class Player
#Defini nbr de joueurs, un emplacement de jeu vide
@@player = 0
@@mark = ""
attr_accessor :pname, :pmark, :ppoints
  def initialize
  	#Initialisation des joueurs
    @pname = ""
    @pmark = ""
    @@player += 1
    @ppoints = 0
  end
  def infos                        
  # Demande les pseudos et affecte les X/O                   
  puts "Quel est ton nom ? :s"
  print ">"
  # Le Joueur 1 commence et choisi son symbole
  @pname = ((gets.chomp).to_s).capitalize           
  	if @@player == 1 && @@mark == ""
		puts "Tu joues le X ou le O ?"
    	while @pmark != "X" && @pmark != "O" do
    	  @pmark = (gets.chomp).to_s.capitalize
    	end
    # Affecte l'autre symbole au Joueur 2
    elsif @@mark == "X"                               
      @pmark = "O"
    elsif @@mark == "O"
      @pmark = "X"
    end
    # Confirmation
    @@mark = @pmark
    puts "#{@pname} jouera avec #{@pmark} !"         
  end
end