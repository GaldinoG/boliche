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

# Classe responsável pelo nivel de dificuldade do jogo
# @author Gabriel Galdino, André Alves
class PontuacaoNivelPC

		# Construtor
		# @return [number] retorna o nivel de dificuldade
    	def nivelPontuacao(nome)
	strNivel = 0
    		loop do
				puts "\n#{nome} digite qual nivel de dificuldade deseja jogar(1-Facil, 2- Medio, 3-Dificil):"
				strNivel = gets.chomp.to_i
				system("clear")
				break if strNivel >= 1 && strNivel <= 3
			end

			case strNivel
				when 1
					number = rand(0..100)
				when 2
					number = rand(100..200)
				when 3
					number = rand(200..300)
			end
    		return number
    	end
end

nme = SetaJogador.new
nome = nme.cadastro
