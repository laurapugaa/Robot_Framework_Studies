*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=NONE

*** Variables ***
${quantidade}    3
${url}    https://adopet-frontend-cypress.vercel.app/cadastro
${verificacao}    //*[@id="root"]/main/section/p

*** Keywords ***
Cadastrar Usuário
    Given Abrir tela de cadastro
    And Inserir dados cadastro
    And Clicar em cadastrar
    And Verificar redirect cadastro

Given Abrir tela de cadastro
    Open Browser    ${url}    chrome
And Inserir dados cadastro
    Input Text    //*[@id="name"]    Laura Puga
    Input Text    //*[@id="email"]    laurapuga@alu.ufc.br
    Input Text    //*[@id="pass-create"]    L2abcdefgh
    Input Text    //*[@id="pass-create"]    L2abcdefgh
And Clicar em cadastrar
    Wait Until Element Is Visible    //button[text()='Cadastrar']    3s
    Scroll Element Into View    //button[text()='Cadastrar']
    Click Element    //*[@id="root"]/main/section/form/button
And Verificar redirect cadastro
    Wait Until Element Is Visible    ${verificacao}    5
    Element Should Be Visible    ${verificacao}
Then Fechar tela cadastro
    Close Browser
