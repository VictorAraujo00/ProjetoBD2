import mysql.connector
import time
from colorama import init, Fore, Back



print(Fore.RED + "Bem vindo a loja de vinhos!")

time.sleep(3)

usuario = input(Fore.CYAN + "Digite o nome de usuário: ")
senha = input("Digite sua senha: ")

conexao = mysql.connector.connect(
    host = 'localhost',
    user = usuario,
    password= senha,
    database = 'lojavinhos'
)

cursor = conexao.cursor()

menu = ['Cadastrar Produto', 'Cadastrar Cliente','Views','Estatísticas' ,'Reajuste salário','Sortear cliente','Vender','Visualizar vendas','Visualizar produtos','Editar produto','Remover produto','Visualizar clientes','Editar cliente','Remover cliente','Visualizar clientes especiais','Visualizar funcionairos','Visualizar funcionarios especiais','Criar Banco de Dados', 'Destruir Banco de Dados']
menu_estatistica = ['Produto mais vendido', 'Vendedor associado ao produto mais vendido', 'Produto menos vendido', 'Valor ganho com o produto mais vendido', 'Mês de maior vendas e mês de menor vendas do produto mais vendido', 'Valor ganho com o produto menos vendido', 'Mês de maior vendas e mês de menor vendas do produto menos vendido']
menu_views = ['Valor médio de vinhos tintos vendidos', 'Vendas de produto por funcionários', 'Valor total ganho por cliente']
continuar = "s"

while continuar == "s":
    print("Escolha o que deseja fazer:")
    for i in range(len(menu)):
        print(str(i+1) + ' - ' + menu[i])

    opcao = int(input("Escolha a opção desejada: "))
    print("\n")

    if opcao == 1:
        nome = input("Digite o nome do produto: ")
        quantidade = input("Digite a quantidade do produto: ")
        descricao = input("Digite a descrição do produto: ")
        valor = input("Digite o valor do produto: ")

        comando = f'INSERT INTO produto(nome, quantidade, descricao, valor) VALUES ("{nome}", {quantidade}, "{descricao}", {valor})'
        cursor.execute(comando)
        conexao.commit()
    
    if opcao == 2:
        nome = input("Digite o nome do cliente: ")
        sexo = input("Digite o sexo do cliente: ")
        idade = input("Digite a idade do cliente: ")
        nascimento = input("Digite a data de nascimento do cliente: ")

        comando = f'INSERT INTO cliente(nome, sexo, idade, nascimento) VALUES ("{nome}", "{sexo}", {idade}, "{nascimento}")'
        cursor.execute(comando)
        conexao.commit()
    if opcao == 3:

        print("Escolha o que deseja fazer:")
        for i in range(len(menu_views)):
            print(str(i+1) + ' - ' + menu_views[i])
        opcao_views = int(input("Escolha a opção desejada: "))
        print("\n")

        if opcao_views == 1:
            comando  = 'SELECT * FROM view_media_valor_vinhos_tintos_vendidos;'
            cursor.execute(comando)
            view = cursor.fetchall()

            for linha in view:
                print("Descrição:", linha[0])
                print("Valor_médio", linha[1], "\n")
        
        if opcao_views == 2:
            comando = 'SELECT * FROM view_vendas_de_produto_por_funcionario;'
            cursor.execute(comando)
            view = cursor.fetchall()

            for linha in view:
                print("Funcionário:", linha[0])
                print("Produto:", linha[1], "\n")

        if opcao_views == 3:
            comando = 'SELECT * FROM view_valor_total_ganho_por_cliente;'
            cursor.execute(comando)
            view = cursor.fetchall()

            for linha in view:
                print('Cliente:', linha[0])
                print('Total_compras:', linha[1], "\n")
        
    if opcao == 4:

        print("Escolha qual estatistica deseja ver: ")
        for i in range(len(menu_estatistica)):
            print(str(i+1) + ' - ' + menu_estatistica[i])

        opcao_estatistica = int(input("Escolha a opção desejada: "))
        print("\n")

        if opcao_estatistica == 1:
            comando  = f'SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda FROM venda JOIN produto ON (produto.id = venda.id_produto) GROUP BY venda.id_produto, produto.nome ORDER BY quantidade_venda DESC LIMIT 1;'
            cursor.execute(comando)
            resultado = cursor.fetchall()
            
            for linha in resultado:
                print("Id_produto:", linha[0])
                print("Nome_produto:", linha[1])
                print("Quantidade_vendida:", linha[2], "\n")


        if opcao_estatistica == 2:
            comando  = f'SELECT venda.id_produto, produto.nome,funcionario.nome, COUNT(venda.id_produto) AS quantidade_venda FROM venda JOIN produto ON (produto.id = venda.id_produto) JOIN funcionario ON(funcionario.id = venda.id_vendedor) GROUP BY venda.id_produto, produto.nome ORDER BY quantidade_venda DESC LIMIT 1;'
            cursor.execute(comando)
            resultado = cursor.fetchall()
            for linha in resultado:
                print("Id_produto:", linha[0])
                print("Nome_produto:", linha[1])
                print("Nome_vendedor:", linha[2])
                print("Quantidade_vendida:", linha[3], "\n")
        
        if opcao_estatistica == 3:
            comando  = f'SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda FROM venda JOIN produto ON (produto.id = venda.id_produto) GROUP BY venda.id_produto, produto.nome ORDER BY quantidade_venda LIMIT 1;'
            cursor.execute(comando)
            resultado = cursor.fetchall()
            for linha in resultado:
                print("Id_produto:", linha[0])
                print("Nome_produto:", linha[1])
                print("Quantidade_produto:", linha[2], "\n")
        
        if opcao_estatistica == 4:
            comando  = f'SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda, SUM(produto.valor) AS ganho_porduto FROM venda JOIN produto ON (produto.id = venda.id_produto) GROUP BY venda.id_produto, produto.nome ORDER BY quantidade_venda DESC LIMIT 1;'
            cursor.execute(comando)
            resultado = cursor.fetchall()
            for linha in resultado:
                print("Id_produto:", linha[0])
                print("Nome_produto:", linha[1])
                print("Quantidade_vendida:", linha[2])
                print("Valor_ganho:", linha[3], "\n")
        
        if opcao_estatistica == 5:
            comando = f'SET @produto_mais_vendido = (SELECT venda.id_produto FROM venda JOIN produto ON (produto.id = venda.id_produto) GROUP BY venda.id_produto ORDER BY sum(venda.id_produto) DESC LIMIT 1);'
            cursor.execute(comando)
            conexao.commit

            comando  = f'SELECT MONTH(venda.data_venda) AS Mes_mais_vendas FROM venda WHERE venda.id_produto = @produto_mais_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) DESC LIMIT 1;'
            cursor.execute(comando)
            resultado1 = cursor.fetchall()

            comando  = f'SELECT MONTH(venda.data_venda) AS Mes_menos_vendas FROM venda WHERE venda.id_produto = @produto_mais_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) LIMIT 1;'
            cursor.execute(comando)
            resultado2 = cursor.fetchall()

            for linha in resultado1:
                print("Mês mais vendido:", linha[0])
            for linha in resultado2:
                print("Mês menos vendido:", linha[0], "\n")
        
        if opcao_estatistica == 6:
            comando = f'SELECT venda.id_produto, produto.nome, COUNT(venda.id_produto) AS quantidade_venda, SUM(produto.valor) AS ganho_porduto FROM venda JOIN produto ON (produto.id = venda.id_produto) GROUP BY venda.id_produto, produto.nome ORDER BY quantidade_venda LIMIT 1;'
            cursor.execute(comando)
            resultado = cursor.fetchall()
            for linha in resultado:
                print("Id_produto:", linha[0])
                print("Nome_produto:", linha[1])
                print("Quantidade_vendida:", linha[2])
                print("Valor_ganho", linha[3], "\n")

        if opcao_estatistica == 7:
            comando = f'SET @produto_menos_vendido = (SELECT venda.id_produto FROM venda JOIN produto ON (produto.id = venda.id_produto) GROUP BY venda.id_produto ORDER BY sum(venda.id_produto) LIMIT 1);'
            cursor.execute(comando)
            conexao.commit

            comando  = f'SELECT MONTH(venda.data_venda) AS Mes_mais_vendas FROM venda WHERE venda.id_produto = @produto_menos_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) DESC LIMIT 1;'
            cursor.execute(comando)
            resultado1 = cursor.fetchall()

            comando  = f'SELECT MONTH(venda.data_venda) AS Mes_mais_vendas FROM venda WHERE venda.id_produto = @produto_menos_vendido GROUP BY data_venda ORDER BY COUNT(MONTH(venda.data_venda)) LIMIT 1;'
            cursor.execute(comando)
            resultado2 = cursor.fetchall()

            for linha in resultado1:
                print("Mês mais vendido:", linha[0])
            for linha in resultado2:
                print("Mês menos vendido:", linha[0])

    if opcao == 5:
        porcentagem_aumento = float(input("Digite a porcentagem de aumento do salário: "))
        categoria = input("Digite qual categoria deseja aumentar o salário: ")

        comando = f'CALL Reajuste({porcentagem_aumento}, "{categoria}")'
        cursor.execute(comando)
        conexao.commit()

    if opcao == 6:
        cursor.callproc('Sorteio')
        for result in cursor.stored_results():
            mensagem = result.fetchall()

        for linha in mensagem:
            print(linha[0], linha[1], linha[2])

    if opcao == 7:
        id_funcionario = int(input("Digite seu id de funcionario: "))
        id_cliente = int(input("Digite o id do cliente: "))
        id_produto = int(input("Digite o id do produto: "))
        comando = f'CALL Venda({id_produto}, {id_funcionario}, {id_cliente})'
        cursor.execute(comando)
        conexao.commit()

        comando = f'SELECT valor FROM PRODUTO WHERE id = {id_produto}'
        cursor.execute(comando)
        valor_produto = cursor.fetchall()

        for valor in valor_produto:
            valor_compra = valor[0]


        if(valor_compra > 500):
            comando = f'SELECT cashback FROM clienteespecial WHERE id_cliente = {id_cliente}'
            cursor.execute(comando)
            cahsback = cursor.fetchall()
            for cashback_venda in cahsback:
                cahsback_cliente = cashback_venda[0]
            print("O valor para custear o cashback será de ", cahsback_cliente)

        if(valor_compra > 1000):
            comando = f'SELECT bonus FROM funcionarioespecial WHERE id_funcionario = {id_funcionario}'
            cursor.execute(comando)
            bonus = cursor.fetchall()
            for bonus_venda in bonus:
                bonus_funcionario = bonus_venda[0]
            print("O valor para custear o bonus é de ", bonus_funcionario)
        

    if opcao == 8:
        comando = 'SELECT * FROM venda'
        cursor.execute(comando)
        consulta = cursor.fetchall()
        for linha in consulta:
            print("Id_venda:", linha[0])
            print("Id_vendedor:",linha[1])
            print("Id_cliente:",linha[2])
            print("Id_produto:",linha[3])
            print("Data_venda:",linha[4], "\n")
    
    if opcao == 9:
        comando = 'SELECT * FROM produto'
        cursor.execute(comando)
        consulta = cursor.fetchall()
        for linha in consulta:
            print("Id_produto:", linha[0])
            print("Nome:", linha[1])
            print("Quantidade:",linha[2])
            print("Decrição",linha[3])
            print("Valor:",linha[4], "\n")
    if opcao == 10:
        id_produto = input("Digite o id do produto que deseja alterar")
        alterar = input("Digite a coluna que deseja alterar:")
        valor = input("Digite o valor para alterar")
        comando = f'UPDATE produto SET {alterar} = "{valor}" WHERE id = {id_produto}'
        cursor.execute(comando)
        conexao.commit()

    if opcao == 11:
        id_produto = input("Digite o id do produto que deseja remover:")
        comando = f'DELETE FROM produto WHERE id = {id_produto}'
        cursor.execute(comando)
        conexao.commit()

    
    if opcao == 12:
        comando = 'SELECT * FROM cliente'
        cursor.execute(comando)
        consulta = cursor.fetchall()
        for linha in consulta:
            print("Id_cliente:", linha[0])
            print("Nome:",linha[1])
            print("Sexo:",linha[2])
            print("Idade:",linha[3])
            print("Nascimento:", linha[4], "\n")

    if opcao == 13:
        id_cliente = input("Digite o id do cliente que seja alterar:")
        alterar = input("Digite a coluna que deseja alterar:")
        valor = input("Digite o valor para alterar:")
        comando = f'UPDATE cliente SET {alterar} = "{valor}" WHERE id = {id_cliente}'
        cursor.execute(comando)
        conexao.commit()

    if opcao == 14:
        id_produto = input("Digite o id do cliente que deseja remover:")
        comando = f'DELETE FROM cliente WHERE id = {id_cliente}'
        cursor.execute(comando)
        conexao.commit()
        
    if opcao == 15:
        comando = 'SELECT * FROM clienteespecial'
        cursor.execute(comando)
        consulta = cursor.fetchall()
        for linha in consulta:
            print("Id_cliente_especial:", linha[0])
            print("Nome:",linha[1])
            print("Sexo:",linha[2])
            print("Idade:",linha[3])
            print("Id_cliente:", linha[4])
            print("Cashback:", linha[5], "\n")

    if opcao == 16:
        comando = 'SELECT * FROM funcionario'
        cursor.execute(comando)
        consulta = cursor.fetchall()
        for linha in consulta:
            print("Id_funcionario:", linha[0])
            print("Nome:",linha[1])
            print("Idade:",linha[2])
            print("Sexo:",linha[3])
            print("Cargo:", linha[4])
            print("Salario:", linha[5])
            print("Nascimento:", linha[6], "\n")

    if opcao == 17:
        comando = 'SELECT * FROM funcionarioespecial'
        cursor.execute(comando)
        consulta = cursor.fetchall()
        for linha in consulta:
            print("Id_funcionario_especial:", linha[0])
            print("Nome:",linha[1])
            print("Idade:",linha[2])
            print("Sexo:",linha[3])
            print("Cargo:", linha[4])
            print("Salario:", linha[5])
            print("Nascimento:", linha[6])
            print("Id_funcionario:", linha[7])
            print("Bônus:", linha[8], "\n")

    if opcao == 18:
        comando = 'CREATE DATABASE lojavinhos'
        cursor.execute(comando)
        conexao.commit()

    if opcao == 19:
        comando = 'DROP DATABASE lojavinhos'
        cursor.execute(comando)
        conexao.commit()


    continuar = input("Deseja fazer mais alguma coisa ?")


cursor.close()
conexao.close()