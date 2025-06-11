*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=NONE
*** Variables ***
${URL}    https://adopet-frontend-cypress.vercel.app/login
${BROWSER}    chrome
${LOCATOR_EMAIL}    //*[@id="email"]
${LOCATOR_PASSWORD}    //*[@id="pass"]
${LOCATOR_BUTTON}    //*[@id="root"]/main/section/form/button


${ERROR_DADOS_VAZIOS}    //*[@id="root"]/main/section/form/p[1]
${ERROR_DADOS_ERRADOS}    //*[@id="root"]/main/section/form/p[2]

${VALIDAR}

*** keywords ***
Abrir site
    Open Browser    ${URL}    ${BROWSER}
Campos vazios
    Sleep    3s
    Click Element    ${LOCATOR_EMAIL}
    Input Text    ${LOCATOR_EMAIL}    text=
    Click Element    ${LOCATOR_PASSWORD}    
    Input Text    ${LOCATOR_PASSWORD}    text=        
    Sleep    3s
    Wait Until Element Is Visible    ${ERROR_DADOS_VAZIOS}    5s
    Element Should Be Visible    ${ERROR_DADOS_VAZIOS}       

Email e Senha Inválidos
    Click Element    ${LOCATOR_EMAIL}
    Input Text    ${LOCATOR_EMAIL}    text=hfiuhfiuhdf
    Click Element    ${LOCATOR_PASSWORD}
    Input Password    ${LOCATOR_PASSWORD}    text=dfvfvdgd
    Sleep    3s
    Wait Until Element Is Visible    ${ERROR_DADOS_ERRADOS}
    Element Should Be Visible    ${ERROR_DADOS_ERRADOS}

Inserir Email Válido e Senha inválida
    Click Element    ${LOCATOR_EMAIL}
    Input Text    ${LOCATOR_EMAIL}    laurapuga@alu.ufc.br
    Click Element    ${LOCATOR_PASSWORD}
    Input Password    ${LOCATOR_PASSWORD}    text=dfvfvdgd
    Sleep    3s
    Wait Until Element Is Visible    ${ERROR_DADOS_VAZIOS}
    Element Should Be Visible    ${ERROR_DADOS_VAZIOS}

Inserir Email Inválido e Senha Válida
    Click Element    ${LOCATOR_EMAIL}
    Input Text    ${LOCATOR_EMAIL}    text=cjdcjdcjmdnc
    Click Element    ${LOCATOR_PASSWORD}
    Input Password    ${LOCATOR_PASSWORD}    text=L2abcdefgh
    Sleep    3s
    Wait Until Element Is Visible    ${ERROR_DADOS_ERRADOS}
    Element Should Be Visible    ${ERROR_DADOS_ERRADOS}

Inserir Email e Senha Válidos
    Click Element    ${LOCATOR_EMAIL}
    Input Text    ${LOCATOR_EMAIL}    text=laurapuga@alu.ufc.br
    Click Element    ${LOCATOR_PASSWORD}
    Input Password    ${LOCATOR_PASSWORD}    text=L2abcdefgh
    Scroll Element Into View    ${LOCATOR_BUTTON}
    Click Button    ${LOCATOR_BUTTON}

Fechar site
    Close Browser
*** Test cases ***
Cenário 1:
    Abrir site
    Campos vazios
    Fechar site

Cenário 2:
    Abrir site
    Email e Senha Inválidos
    Fechar site
Cenário 3:
    Abrir site
    Inserir Email Válido e Senha inválida
    Fechar site
Cenário 4:
    Abrir site
    Inserir Email Inválido e Senha Válida
    Fechar site

Cenário 5:
    Abrir site
    Inserir Email e Senha Válidos
    Fechar site
