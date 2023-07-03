"""Desafio
O objetivo deste programa é ajudar a equipe do Restaurante Veggieworld a identificar rapidamente os
pedidos veganos e não veganos e informar as calorias de cada prato definido pelo cliente. O programa deve solicitar
ao usuário o número de pedidos feitos e, em seguida, pedir informações sobre cada pedido, incluindo se o
prato é vegano ou não (usando as opções "s" para sim e "n" para não) e a quantidade de calorias. Ao final,
o programa deve exibir uma lista de todos os pedidos com suas informações correspondentes.

Entrada
- Um inteiro "n", que representa o número de pedidos que o usuário deseja fazer. Para cada pedido, o usuário deve
inserir:
- O nome do prato;
- A quantidade de calorias do prato;
- se o prato é vegano ou não (usando as opções "s" para sim e "n" para não).

Saída
O programa deve exibir uma lista de todos os pedidos com suas informações correspondentes,
incluindo o nome do prato, se é vegano ou não, e a quantidade de calorias."""

num_pedidos = int(input())

for i in range(1, num_pedidos + 1):
    prato = input()
    calorias = int(input())
    ehVegano = False
    opc = input().lower()

    if opc == "s":
        ehVegano = True

    display = "Vegano" if ehVegano else "Nao-vegano"

    print(f"Pedido {i}: {prato} ({display}) - {calorias} calorias")