*** Settings ***
Resource    ../resource/busca_ap_resource.robot

Test Setup        Run Keywords
...               Abrir o navegador
...               Acessar a pagina de login do AoCubo
...               Realizar o login com usuario valido

Test Teardown    Fechar o navegador

***Test Case***
CT 01 - Busca por nome e filtros
    Acessar o menu "imoveis"
    Digitar nome do imovel na Busca "Imóvel teste automatizado robot"
    Adicionar filtro de incorporadora "BKO"
    Adicionar filtro de preço enrtre "1.134.667,00" e "1.140.000,00"
    Adicionar filtro de estagio da obra
    Verificar se o imovel é exibido 