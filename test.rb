#Jogo de adivinhação em Ruby
puts "Bem vindo ao Jogo de Adivinhação!"
puts "Estou pensando em um número entre 1 e 100, tente adivinhar!"

#O computador irá escolher um número aleatório entre 1 e 100
numero_secreto = rand (1..100)
tentativas = 0

#Loop para o jogador tentar adivinhar
loop do 
  print "Digite seu palpite: "
  palpite = gets.chomp.to_i #Lê o palpite do jogador e converte para inteiro
  tentativas += 1 #Conta as alternativas

  if palpite < numero_secreto
    puts "O número é maior do que #{palpite}. Tente novamente!"
  elsif palpite > numero_secreto
    puts "O número é menor do que #{palpite}. Tente novamente!"
  else
    puts "Parabéns! Você acertou o número em #{tentativas} tentativas."
break #Sai do loop quando o jogador acertar
  end
end
