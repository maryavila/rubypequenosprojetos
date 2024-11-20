# RPG de Texto Simples

# Classe que representa um personagem (herói ou inimigo)
class Personagem
  attr_accessor :nome, :vida, :ataque

  # Inicializa o personagem com nome, pontos de vida e valor de ataque
  def initialize(nome, vida, ataque)
    @nome = nome
    @vida = vida
    @ataque = ataque
  end

  # Método para o personagem atacar outro personagem
  def atacar(inimigo)
    # Calcula o dano aleatório entre 1 e o valor de ataque do personagem
    dano = rand(1..@ataque)
    puts "#{@nome} ataca #{inimigo.nome} e causa #{dano} de dano!"
    
    # Reduz a vida do inimigo pelo valor do dano causado
    inimigo.vida -= dano
    
    # Verifica se o inimigo foi derrotado (vida <= 0)
    if inimigo.vida <= 0
      puts "#{inimigo.nome} foi derrotado!"
    else
      # Mostra a quantidade de vida restante do inimigo, caso ele não tenha sido derrotado
      puts "#{inimigo.nome} ainda tem #{inimigo.vida} pontos de vida."
    end
  end
end

# Classe que representa o jogo em si
class Jogo
  # Inicializa o jogo com um herói e uma lista de inimigos
  def initialize
    @heroi = Personagem.new("Herói", 30, 10)
    @inimigos = [
      Personagem.new("Goblin", 10, 3),
      Personagem.new("Orc", 15, 5),
      Personagem.new("Troll", 20, 7)
    ]
  end

  # Método principal para rodar o jogo
  def jogar
    puts "Bem-vindo ao RPG de Texto!"
    puts "Você é um herói com #{@heroi.vida} pontos de vida e #{@heroi.ataque} de ataque."
    puts "Sua missão é derrotar todos os inimigos!"

    # Loop para enfrentar cada inimigo da lista
    @inimigos.each do |inimigo|
      # Continua o loop enquanto o inimigo e o herói ainda tiverem vida
      while inimigo.vida > 0 && @heroi.vida > 0
        # Exibe as opções de ação para o jogador
        puts "\nO que você deseja fazer?"
        puts "1. Atacar o #{inimigo.nome}"
        puts "2. Fugir"
        
        # Recebe a escolha do jogador e converte para um número inteiro
        escolha = gets.chomp.to_i

        # Verifica a escolha do jogador
        if escolha == 1
          # O herói ataca o inimigo
          @heroi.atacar(inimigo)
          
          # O inimigo contra-ataca se ainda estiver vivo
          inimigo.atacar(@heroi) if inimigo.vida > 0
        elsif escolha == 2
          # O jogador escolheu fugir
          puts "Você fugiu da batalha!"
          break # Sai do loop para o próximo inimigo
        else
          # Caso o jogador escolha uma opção inválida
          puts "Escolha inválida! Tente novamente."
        end

        # Verifica se o herói foi derrotado
        if @heroi.vida <= 0
          puts "Você foi derrotado! Fim de jogo."
          return # Sai do jogo completamente
        end
      end
    end

    # Se o herói derrotou todos os inimigos, exibe mensagem de vitória
    if @heroi.vida > 0
      puts "Parabéns! Você derrotou todos os inimigos e venceu o jogo!"
    end
  end
end

# Inicializa e começa o jogo
Jogo.new.jogar

