# Definindo a classe Produto
class Produto
  attr_accessor :id, :nome, :categoria_id, :quantidade, :preco

  def initialize(id, nome, categoria_id, quantidade, preco)
    @id = id
    @nome = nome
    @categoria_id = categoria_id
    @quantidade = quantidade
    @preco = preco
  end
end

# Definindo a classe Categoria
class Categoria
  attr_accessor :id, :nome

  def initialize(id, nome)
    @id = id
    @nome = nome
  end
end

# Definindo a classe Movimentacao
class Movimentacao
  attr_accessor :id, :produto_id, :quantidade, :tipo_movimentacao, :data

  def initialize(id, produto_id, quantidade, tipo_movimentacao, data)
    @id = id
    @produto_id = produto_id
    @quantidade = quantidade
    @tipo_movimentacao = tipo_movimentacao
    @data = data
  end
end

# Função para cadastrar um novo produto
def cadastrar_produto(produtos, contador_produtos)
  puts "Nome do Produto: "
  nome = gets.chomp

  puts "ID da Categoria: "
  categoria_id = gets.to_i

  puts "Quantidade: "
  quantidade = gets.to_i

  puts "Preço: "
  preco = gets.to_f

  produto = Produto.new(contador_produtos + 1, nome, categoria_id, quantidade, preco)
  produtos << produto
  puts "Produto cadastrado com sucesso!"
end

# Função para consultar um produto pelo ID
def consultar_produto_por_id(produtos, id)
  produto = produtos.find { |p| p.id == id }
  if produto
    puts "ID: #{produto.id}, Nome: #{produto.nome}, Categoria ID: #{produto.categoria_id}, Quantidade: #{produto.quantidade}, Preço: #{produto.preco}"
  else
    puts "Produto não encontrado!"
  end
end

# Função para registrar uma movimentação de estoque
def registrar_movimentacao(movimentacoes, contador_movimentacoes, produtos)
  puts "ID do Produto: "
  produto_id = gets.to_i

  puts "Quantidade: "
  quantidade = gets.to_i

  puts "Tipo de Movimentação (E para entrada, S para saída): "
  tipo_movimentacao = gets.chomp.upcase

  puts "Data (DD/MM/AAAA): "
  data = gets.chomp

  produto = produtos.find { |p| p.id == produto_id }
  if produto
    if tipo_movimentacao == 'E'
      produto.quantidade += quantidade
    elsif tipo_movimentacao == 'S'
      if produto.quantidade >= quantidade
        produto.quantidade -= quantidade
      else
        puts "Quantidade insuficiente no estoque!"
        return
      end
    end
    movimentacao = Movimentacao.new(contador_movimentacoes + 1, produto_id, quantidade, tipo_movimentacao, data)
    movimentacoes << movimentacao
    puts "Movimentação registrada com sucesso!"
  else
    puts "Produto não encontrado!"
  end
end

# Função para gerar um relatório de estoque
def gerar_relatorio_estoque(produtos)
  puts "Relatório de Estoque:"
  produtos.each do |produto|
    puts "ID: #{produto.id}, Nome: #{produto.nome}, Quantidade: #{produto.quantidade}, Preço: #{produto.preco}"
  end
end

# Função para consultar movimentações de um produto específico
def consultar_movimentacoes(movimentacoes, produto_id)
  puts "Movimentações do Produto ID #{produto_id}:"
  movimentacoes.each do |movimentacao|
    if movimentacao.produto_id == produto_id
      puts "ID: #{movimentacao.id}, Quantidade: #{movimentacao.quantidade}, Tipo: #{movimentacao.tipo_movimentacao}, Data: #{movimentacao.data}"
    end
  end
end

# Função principal para execução do programa
def main
  produtos = []
  movimentacoes = []
  contador_produtos = 0
  contador_movimentacoes = 0

  loop do
    puts "\n--- Sistema de Estoque ---"
    puts "1. Cadastrar Produto"
    puts "2. Consultar Produto por ID"
    puts "3. Registrar Movimentação"
    puts "4. Gerar Relatório de Estoque"
    puts "5. Consultar Movimentações de um Produto"
    puts "0. Sair"
    print "Escolha uma opção: "
    opcao = gets.to_i

    case opcao
    when 1
      cadastrar_produto(produtos, contador_produtos)
      contador_produtos += 1
    when 2
      puts "Digite o ID do Produto: "
      id = gets.to_i
      consultar_produto_por_id(produtos, id)
    when 3
      registrar_movimentacao(movimentacoes, contador_movimentacoes, produtos)
      contador_movimentacoes += 1
    when 4
      gerar_relatorio_estoque(produtos)
    when 5
      puts "Digite o ID do Produto para consultar movimentações: "
      produto_id = gets.to_i
      consultar_movimentacoes(movimentacoes, produto_id)
    when 0
      puts "Saindo..."
      break
    else
      puts "Opção inválida!"
    end
  end
end

# Chamando a função principal
main
