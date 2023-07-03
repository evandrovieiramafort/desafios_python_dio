"""Desafio
Você está criando um aplicativo de entrega de comida e precisa calcular o preço final do pedido do
usuário. O usuário escolheu alguns itens do cardápio e será preciso calcular o preço total do pedido.

Entrada:
A entrada deve receber os valores abaixo:
- valorHamburguer: o valor unitário de um hambúrguer.
- quantidadeHamburguer: a quantidade de hambúrgueres que o usuário deseja.
- valorBebida: o valor unitário de uma bebida.
- quantidadeBebida: a quantidade de bebidas que o usuário deseja.
- valorPago: o valor pago pelo usuário.

Saída:
A saída deve retornar um texto informando o valor total do pedido e a quantidade de troco que será necessário"""

valor_hamburguer = float(input())
quantidade_hamburguer = int(input())
valor_bebida = float(input())
quantidade_bebida = int(input())
valor_pago = float(input())

total_hamburguer = valor_hamburguer * quantidade_hamburguer
total_bebida = valor_bebida * quantidade_bebida
troco = valor_pago - (total_bebida + total_hamburguer)

print(f"O preço final do pedido é R$ {total_hamburguer + total_bebida:.2f}. Seu troco é R$ {troco:.2f}.")
