*** Settings ***

Resource    main.robot

*** Test Cases ***
Teste 1
    [Documentation]    Esse teste serve para acessar o site de venda de carros
    [Tags]    car    sale    accessories
    Abrir navegador
    Selecionar o carros
    Selecionar o ano
    Selecionar modelo
    Selecionar servico
    Adicionar primeiro produto no carrinho
    Voltar a comprar
    Adicionar segundo produto no carrinho
    Ver produtos comprados