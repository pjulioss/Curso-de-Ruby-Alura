def boas_vindas
  puts
  print "Para começarmos me diga seu nome: "
  nome = gets.strip # .strip limpa o ultimo caractere em branco/vazio/quebra de linha
  puts
  puts "#{nome}, bem vindo ao jogo onde o objetivo é adivinhar um número."
  puts
end

def dificuldade_do_jogo
  puts "Escolha a dificuldade do jogo:"
  puts "(1 - muito fácil) (2 - fácil) (3 - médio) (4 - difícil) (5 - muito difícil)"
  dificuldade = gets.to_i

end

def sorteia_numero_secreto (dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end
  puts "Gerando um número aleátorio entre 1 e #{maximo}"
  puts "Número gerado, agora vamos ver se você consegue adivinhar..."
  puts
  numero_sorteado = rand(maximo)+1 #rand()gera um num entre 0 e 100
  numero_sorteado
end

def pede_um_numero(chutes, tentativas, limite_tentativas)
  puts "Você está na tentativa #{tentativas} de #{limite_tentativas}"
  puts "Chutes ate agora #{chutes}"
  chute = gets.strip
  chute.to_i
end

def verifica_acerto (numero_secreto, chute)
  comparacao = numero_secreto == chute
  if comparacao
    puts
    puts "Parabéns você acertou!"
    return true
  end
    chute_digitado = numero_secreto > chute
    if chute_digitado
      puts
      puts "O seu palpite foi menor que o número secreto!"
      puts
    else
      puts
      puts "O seu palpite foi maior que o número secreto!"
      puts
    end
  false
end

boas_vindas
dificuldade = dificuldade_do_jogo
numero_secreto = sorteia_numero_secreto dificuldade

pontos_inicial = 1000
limite_tentativas = 5
chutes = []

for tentativas in 1..limite_tentativas
  chute = pede_um_numero(chutes, tentativas, limite_tentativas)
  chutes << chute

  pontos_perdidos = (chute - numero_secreto).abs / 2.0
  pontos_inicial -= pontos_perdidos

  if verifica_acerto(numero_secreto, chute)
    break
  end
end

puts "Voce terminou o jogo com #{pontos_inicial} pontos"
