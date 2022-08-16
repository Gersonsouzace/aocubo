*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                                https://portal.dev.cloud.aocubo.com/login
${EMAIL INPUT}                        //input[contains(@type,'email')]
${SENHA INPUT}                        //input[contains(@type,'password')]
${EMAIL}                              vsantos.lvieira@gmail.com
${SENHA}                              Lopo@2812
${LoginButton}                        //button[@data-testid='login-button'][contains(.,'Fazer login')]
${MENU LATERAL AREA LOGADO}           //div[@class='styles__Content-sc-1sbqjsh-4 bklNYr'][contains(.,'ImóveisListasEquipeBlogPerfilSair')]
${MENU IMOVEIS}                       //a[@href='/dashboard/imoveis']
${H1 IMOVEIS}                         //h2[@class='styles__Title-sc-1f6rqub-2 ibSVOb'][contains(.,'Imóveis')]
${BARA DE BUSCA}                      //input[@name='search']
${ELEMNT INCORPORADA}                 //div[@class='styles__HeaderFieldItem-sc-1f6rqub-10 gWWghp'][contains(.,'Incorporadora')]
${BUSCA DO MENU INCORPORADA}          //input[contains(@name,'searchCorp')]
${BKO ICON}                           //img[contains(@alt,'BKO')]
${ELEMENT PREÇO}                      //div[@class='styles__FieldItem-sc-1f6rqub-13 fSuMjk'][contains(.,'PreçoFaixa de PreçoatéLimpar FiltrosAplicar Filtros')]
${ELEMENT PREÇO FROM}                 //input[contains(@name,'priceFrom')]
${ELEMENT PREÇO UNTIL}                //input[contains(@name,'priceUntil')]
${ELEMENT ESTAGIO DE OBRA}            //div[@class='styles__FieldItem-sc-1f6rqub-13 fSuMjk'][contains(.,'Estágio da Obra Estágio da ObraLançamentoEm ObrasProntoLimpar FiltrosAplicar Filtros')]
${ESTAGIO DE OBRA PRONTO}             (//label[contains(.,'Pronto')])[2]
${APLICAR FILTRO ESTAGIO DE OBRA}     (//button[contains(.,'Aplicar Filtros')])[4]
${H3 IMOVEL TEST}                     //h3[contains(.,'Imóvel teste automatizado robot (não excluir nem alterar)')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o Navegador
    Capture Page Screenshot
    Close Browser

Acessar a pagina de login do AoCubo
    Go To    url=${URL}
    Wait Until Element Is Visible    ${LoginButton} 

Digitar nome do imovel na Busca "${NOME IMOVEL}"
   Input Text    ${BARA DE BUSCA}    ${NOME IMOVEL}

Adicionar filtro de incorporadora "${INCORPORADA}"
    Click Element    ${ELEMNT INCORPORADA} 
    Wait Until Element Is Visible    ${BUSCA DO MENU INCORPORADA}
    Input Text    ${BUSCA DO MENU INCORPORADA}    ${INCORPORADA}
    Wait Until Element Is Visible    ${BKO ICON}
    Click Element    ${BKO ICON}

Adicionar filtro de preço enrtre "${PRECO01}" e "${PRECO02}"
    Wait Until Element Is Enabled    ${ELEMENT PREÇO}
    Click Element    ${ELEMENT PREÇO}
    Wait Until Element Is Visible    ${ELEMENT PREÇO FROM}
    Input Text    ${ELEMENT PREÇO FROM}    ${PRECO01}
    Input Text    ${ELEMENT PREÇO UNTIL}    ${PRECO02}

Adicionar filtro de estagio da obra
   Click Element                    ${ELEMENT ESTAGIO DE OBRA}
   Wait Until Element Is Visible    ${ESTAGIO DE OBRA PRONTO}
   Click Element                    ${ESTAGIO DE OBRA PRONTO}
   Click Button                     ${APLICAR FILTRO ESTAGIO DE OBRA}    

Verificar se o imovel é exibido 
    Wait Until Element Is Visible    ${H3 IMOVEL TEST}
Realizar o login com usuario valido
    Login With    ${EMAIL}    ${SENHA}
    Click Button    ${LoginButton}
    Wait Until Element Is Visible    ${MENU LATERAL AREA LOGADO}

Login With
    [Arguments]       ${user}   ${pass} 
    Input Text        ${EMAIL INPUT}    ${user}
    Input Text        ${SENHA INPUT}    ${pass}

 Acessar o menu "imoveis"
    Wait Until Element Is Enabled    ${MENU IMOVEIS}
    Click Link    ${MENU IMOVEIS}
    Wait Until Element Is Visible    ${H1 IMOVEIS}

