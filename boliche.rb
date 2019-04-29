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

# Classe responsável pelos calculos do jogo
# @author Gabriel Galdino, André Alves
class PontuacaoUsuario

	# Construtor
	# @return [ptos] retorna o total do Score
	def calculaPontuacao(nome)
		
		qt_pinos, qt_pinos2, ptos, i, j = [0,0,0,1,1]
		booStrike = false
		sumProx = false
		auxValor2 = false
		auxSpare = false
		strAux = 0
		countSoma = Array.new
		contagem = 10

		for i in 1..contagem
			loop do
				puts("\n#{nome} quantos pinos voce derrubou no frame #{i} da jogada 1: ")
				qt_pinos = gets.chomp.to_i
				system("clear")
				break if qt_pinos <= 10
			end
				
			if auxValor2 == true or auxSpare == true
				ptos = ptos + qt_pinos
				auxSpare = false
			end

			if sumProx == true 
				ptos = ptos + qt_pinos
				sumProx = false
				auxValor2 = true
			end
			
			if qt_pinos < 10
				loop do
					puts("#{nome} quantos pinos voce derrubou no frame #{i} da jogada 2: ")
					qt_pinos2 = gets.chomp.to_i
					system("clear")
					break if qt_pinos + qt_pinos2 <= 10
				end

				if auxValor2 == true 
					ptos = ptos + qt_pinos2
					auxValor2 = false
				end

				if qt_pinos + qt_pinos2 == 10
					auxSpare = true
				end 
				
			elsif qt_pinos == 10
				if i == contagem then
					booStrike = true
				end
				sumProx = true 
				auxSpare = false
			end

			system("clear")

			sum = qt_pinos + qt_pinos2
        		ptos=ptos+sum
			
			if sumProx == true 
				countSoma.push("Jogada #{i} --> Pontos #{sum} --> Strike")
			elsif auxSpare == true
				countSoma.push("Jogada #{i} --> Pontos #{sum} --> Spare")
			else
				countSoma.push("Jogada #{i} --> Pontos #{sum}")
			end


        	puts ptos
        		
        	qt_pinos = 0
        	qt_pinos2 = 0
		end

		if booStrike == true or auxSpare == true
			
			if sumProx == true 
				bonus = 1
				puts("\n\nVoce ganhou 2 jogadas bonus pelo strike feito no primeiro arremeco do ultimo frame!!!")
			elsif auxSpare == true
				bonus = 2
				puts("\n\nVoce ganhou 1 jogada bonus pelo spare feito no ultimo frame!!!")
			end
			
			aux = bonus
			for var in aux..2
				
				loop do
					puts("\n\n#{nome} quantos pinos voce derrubou na jogada Bonus de frame 1?")
					qt_pinos = gets.chomp.to_i
					system("clear")
					break if qt_pinos <= 10
				end
				
				if auxSpare == true
					ptos = ptos + qt_pinos
					auxSpare = false
				elsif sumProx == true 
					ptos = ptos + qt_pinos
					sumProx = false
					auxValor2 = true
				end
				
				if bonus == 1 
					if qt_pinos < 10
						loop do
							puts("#{nome} quantos pinos voce derrubou na jogada Bonus de frame #{bonus} da jogada 2: ")
							qt_pinos2 = gets.chomp.to_i
							system("clear")
							break if qt_pinos + qt_pinos2 <= 10
						end
					
						if auxValor2 == true 
							ptos = ptos + qt_pinos2
							auxValor2 = false
						end

						if qt_pinos + qt_pinos2 == 10
							auxSpare = true
						end 
					elsif qt_pinos == 10
						auxValor2 = false
					end
				end

			system("clear")

			sum = qt_pinos + qt_pinos2
        		ptos=ptos+sum
        		puts "#{ptos}\n"
        		
        		qt_pinos = 0
        		qt_pinos2 = 0
			end
		end 
	countSoma.each { |a| a }
	puts countSoma
	return ptos
	end
end


nme = SetaJogador.new
nome = nme.cadastro
