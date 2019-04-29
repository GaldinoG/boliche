# Classe responsável por cadastrar nome do Jogador
# @author Gabriel Galdino, André Alves
class SetaJogador
	
	# Contrutor
	# @return [nome] retorna input digitado
	def cadastro
	    puts("Digite seu nome: ")
	    STDOUT.flush	    
		nome = gets.chomp
	    return nome
	end	    
end

nme = SetaJogador.new
nome = nme.cadastro
