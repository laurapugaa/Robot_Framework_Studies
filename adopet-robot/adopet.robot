** Settings **
Library    SeleniumLibrary    screenshot_root_directory=NONE

** Variables **
${URL_CADASTRO}    https://adopet-frontend-cypress.vercel.app/cadastro
${URL_LOGIN}    https://adopet-frontend-cypress.vercel.app/login
${URL_HOME}    https://adopet-frontend-cypress.vercel.app/home
${VERIFICACAO}    //*[@id="root"]/main/section/p

** Keywords **
Abrir tela de cadastro
    Open Browser    ${URL_cadastro}    chrome

Inserir dados cadastro
    Input Text    //*[@id="name"]    Laura Puga
    Input Text    //*[@id="email"]    laurapuga@alu.ufc.br
    Input Text    //*[@id="pass-create"]    L2abcdefgh
    Input Text    //*[@id="pass-create"]    L2abcdefgh

Clicar em cadastrar
    Wait Until Element Is Visible    //button[text()='Cadastrar']    3s
    Scroll Element Into View    //button[text()='Cadastrar']
    Click Element    //*[@id="root"]/main/section/form/button

Verificar redirect cadastro
    Wait Until Element Is Visible    ${VERIFICACAO}    5
    Element Should Be Visible    ${VERIFICACAO}

Fechar tela cadastro
    Close Browser

Abrir tela de login
    Open Browser    ${URL_LOGIN}    chrome

Inserir dados login
    Input Text    //*[@id="email"]    laurapuga@alu.ufc.br
    # Wait Until Element Is Visible    //*[@id="pass"]    3s
    Scroll Element Into View    //*[@id="pass"]
    Input Text    //*[@id="pass"]    L2abcdefgh
    Scroll Element Into View    //*[@id="root"]/main/section/form/button

Clicar em entrar
    Wait Until Element Is Visible    //*[@id="root"]/main/section/form/button    3s
    Scroll Element Into View    //*[@id="root"]/main/section/form/button
    Click Element    //*[@id="root"]/main/section/form/button

Verificar redirect login
    Wait Until Element Is Visible    ${VERIFICACAO}    5s
    Element Should Be Visible    ${VERIFICACAO}

Fechar tela login
    Close Browser

Encaminhar para tela de perfil
    Scroll Element Into View    //*[@id="root"]/main/section/p
    Scroll Element Into View    //*[@id="root"]/main/header/nav

    Wait Until Element Is Visible    //*[@id="headlessui-menu-button-:r0:"]/img
    Element Should Be Visible    //*[@id="headlessui-menu-button-:r0:"]/img
    Click Element    //*[@id="headlessui-menu-button-:r0:"]/img
    
    Wait Until Element Is Visible    //*[@id="headlessui-menu-items-:r1:"]/a
    Element Should Be Visible    //*[@id="headlessui-menu-items-:r1:"]/a
    Click Element    //*[@id="headlessui-menu-items-:r1:"]/a

    Wait Until Element Is Visible    //*[@id="root"]/main/section/p    3s
    Element Should Be Visible    //*[@id="root"]/main/section/p
    
    Scroll Element Into View    //*[@id="nome"]

Inserir dados perfil
    Input Text    //*[@id="nome"]    Laura
    Input Text    //*[@id="telefone"]    91984558463
    Input Text    //*[@id="cidade"]    Brasília
    Input Text    //*[@id="sobre"]    Descrição de texto aleatória de teste no adopet

Clicar em salvar perfil
    Wait Until Element Is Visible    //*[@id="root"]/main/section/form/button    3s
    Scroll Element Into View    //*[@id="root"]/main/section/form/button
    Click Element    //*[@id="root"]/main/section/form/button

Verificar redirect perfil
    Wait Until Element Is Visible    ${VERIFICACAO}    5
    Element Should Be Visible    ${VERIFICACAO}

Fechar tela de perfil
    Close Browser

** Test Cases **
Cenário1: Preencher formulario de cadastro
    Abrir tela de cadastro
    Inserir dados cadastro
    Clicar em cadastrar
    Verificar redirect cadastro
    Fechar tela cadastro

Cenário2: Preencher formulário de login
    Abrir tela de login
    Inserir dados login
    Clicar em entrar
    Verificar redirect login
    Fechar tela login

Cenário3: Ver perfil e atualizar dados
    Abrir tela de login
    Inserir dados login
    Clicar em entrar
    Verificar redirect login
    Encaminhar para tela de perfil
    Inserir dados perfil
    Clicar em salvar perfil
    Fechar tela de perfil