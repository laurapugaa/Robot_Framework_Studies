** Settings **
Library    SeleniumLibrary    screenshot_root_directory=NONE

** Variables **

${url_cadastro}    https://adopet-frontend-cypress.vercel.app/cadastro
${url_login}    https://adopet-frontend-cypress.vercel.app/login
${url_home}    https://adopet-frontend-cypress.vercel.app/home
${verificacao}    //*[@id="root"]/main/section/p

** Keywords **

Abrir tela de cadastro
    Open Browser    ${url_cadastro}    chrome
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
    Wait Until Element Is Visible    ${verificacao}    5
    Element Should Be Visible    ${verificacao}
Fechar tela cadastro
    Close Browser




Abrir tela de login
    Open Browser    ${url_login}    chrome
Inserir dados login
    Input Text    //*[@id="email"]    laurademirandapuga@gmail.com
    Wait Until Element Is Visible    //*[@id="pass"]    3s
    Scroll Element Into View    //*[@id="pass"]
    Input Text    //*[@id="pass"]    L2abcdefgh
Clicar em entrar
    Wait Until Element Is Visible    //*[@id="root"]/main/section/form/button    3s
    Scroll Element Into View    //*[@id="root"]/main/section/form/button
    Click Element    //*[@id="root"]/main/section/form/button

Verificar redirect login
    Wait Until Element Is Visible    ${verificacao}    5s
    Element Should Be Visible    ${verificacao}
Fechar tela login
    Close Browser


Abrir tela home e encaminhar para tela de perfil
    Open Browser    ${url_home}    chrome
    Wait Until Element Is Visible    //*[@id="root"]/main/section/p   
    Element Should Be Visible    //*[@id="root"]/main/section/p    

    Click Element    //button[contains(@class, 'menu__button')]
    
    Wait Until Element Is Visible    //*[@id="root"]/main/section/p    3s
    Element Should Be Visible    //*[@id="root"]/main/section/p
    
    Scroll Element Into View    //*[@id="telefone"]

Inserir dados perfil
    Input Text    //*[@id="telefone"]    91984558463
    Input Text    //*[@id="cidade"]    Brasília
    Input Text    //*[@id="sobre"]    Descrição de texto aleatória de teste no adopet
Clicar em salvar perfil
    Wait Until Element Is Visible    //*[@id="root"]/main/section/form/button    3s
    Scroll Element Into View    //*[@id="root"]/main/section/form/button
    Click Element    //*[@id="root"]/main/section/form/button
Verificar redirect perfil
    Wait Until Element Is Visible    ${verificacao}    5
    Element Should Be Visible    ${verificacao}
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
    Abrir tela home e encaminhar para tela de perfil
    Inserir dados perfil
    Clicar em salvar perfil
    Fechar tela de perfil