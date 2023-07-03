"""
Desafio
Imagine que você está criando um aplicativo de entrega de comida e precisa informar ao usuário o tempo
estimado de entrega de um restaurante. A mensagem deve conter o nome do restaurante e o tempo estimado de entrega em x
minutos.

Entrada
A entrada deverá receber os valores abaixo:
- nomeRestaurante (string): o nome do restaurante desejado.
- tempoEstimadoEntrega (number): o tempo estimado de entrega em minutos.

Saída
Deverá retornar uma mensagem (string) informando ao usuário o tempo estimado de entrega do
restaurante."""

nomeRestaurante = input()
tempoEstimadoEntrega = int(input())

print(f"O restaurante {nomeRestaurante} entrega em {tempoEstimadoEntrega} minutos.")