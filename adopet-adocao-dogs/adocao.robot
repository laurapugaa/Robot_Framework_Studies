*** Settings ***
Resource    ../adopet-robot/adopet.robot
Library    SeleniumLibrary    screenshot_root_directory=NONE

*** Variables ***
${URL_LOGIN}    https://adopet-frontend-cypress.vercel.app/login
${URL_HOME}    https://adopet-frontend-cypress.vercel.app/home
${VERIFICACAO}    https://adopet-frontend-cypress.vercel.app/mensagem

${CHAT_RESPONSAVEL_DUNGA}    //*[@id="root"]/main/section/div/div[1]/a

# ${CHAT_RESPONSAVEL_FELICIA}    //*[@id="root"]/main/section/div/div[2]/a
# ${CHAT_RESPONSAVEL_SIRIUS}    //*[@id="root"]/main/section/div/div[3]/a
# ${CHAT_RESPONSAVEL_FIONA}    //*[@id="root"]/main/section/div/div[4]/a
# ${CHAT_RESPONSAVEL_SID}    //*[@id="root"]/main/section/div/div[5]/a
# ${CHAT_RESPONSAVEL_YODA}    //*[@id="root"]/main/section/div/div[6]/a
# ${CHAT_RESPONSAVEL_LUA}    //*[@id="root"]/main/section/div/div[7]/a
# ${CHAT_RESPONSAVEL_AMORA}    //*[@id="root"]/main/section/div/div[8]/a
# ${CHAT_RESPONSAVEL_ZELDA}    //*[@id="root"]/main/section/div/div[9]/a

#//span[contains(text(), "TEXTO DO ITEM")]

${NOME}    //*[@id="name"]
${TELEFONE}    //*[@id="phone"]
${NOME_ANIMAL}    //*[@id="petName"]
${CAMPO_MENSAGEM}    //*[@id="msg"]

${ENVIAR}    //*[@id="root"]/main/section/form/button

*** Keywords ***
Abrir tela de login
    Open Browser    ${URL_LOGIN}    chrome

Inserir dados login
    Input Text    //*[@id="email"]    laurapuga@alu.ufc.br
    Wait Until Element Is Visible    //*[@id="pass"]    3s
    Scroll Element Into View    //*[@id="pass"]
    Input Text    //*[@id="pass"]    L2abcdefgh

Clicar em entrar
    Wait Until Element Is Visible    //*[@id="root"]/main/section/form/button    3s
    Scroll Element Into View    //*[@id="root"]/main/section/form/button
    Click Element    //*[@id="root"]/main/section/form/button
    
Abrir chat com o responsável pelo dog 
    Wait Until Element Is Visible    ${CHAT_RESPONSAVEL_DUNGA}    3s
    Element Should Be Visible    ${CHAT_RESPONSAVEL_DUNGA}
    Click Element    ${CHAT_RESPONSAVEL_DUNGA}

Inserir dados animal 1 
    Wait Until Element Is Visible    //*[@id="root"]/main/section/p    5s  
    Input Text    ${NOME}    Aline
    Input Text    ${TELEFONE}    91912345678
    Input Text    ${NOME_ANIMAL}    Dunga

Inserir mensagem para o responsável pelo pet
    Input Text    ${CAMPO_MENSAGEM}    Olá, esta é uma mensagem de teste!

Enviar dados
    Scroll Element Into View    ${ENVIAR}
    Click Element    ${ENVIAR}
    Wait Until Element Is Visible    //*[@id="root"]/main/section/p    2s
    Element Should Be Visible    //*[@id="root"]/main/section/p
    
Fechar tela
    Close Browser

*** Test cases ***
Cenário 1:
    Abrir tela de login
    Inserir dados login
    Clicar em entrar
    Abrir chat com o responsável pelo dog 
    Inserir dados animal 1 
    Inserir mensagem para o responsável pelo pet
    Enviar dados
    Fechar tela

