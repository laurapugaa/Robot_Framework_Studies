*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem

*** Variables ***
@{USUARIOS}    laurapuga    alinepuga    mariaantoniapuga

*** Keywords ***
1 - Usando FOR com RANGE
    FOR    ${COUNT}    IN RANGE    1    4
    Log    Meu contador atual é: ${COUNT} 
    Run Keyword If    ${COUNT} == 4    Log    Loop finalizado!
    END

2 - Usando FOR com LISTA
    FOR    ${USUARIO}    IN    @{USUARIOS}
    Log    Meu usuário é: ${USUARIO}
    Run Keyword If    '${USUARIO}' == 'mariaantoniapuga'    Log    Loop finalizado!
    END

3 - Saindo de um FOR
    FOR    ${USUARIO}    IN    @{USUARIOS}
    Exit For Loop If    '${USUARIO}' == 'alinepuga'
    Log    Meu usuário é: ${USUARIO}
    END

4 - Usando a keyword REPEAT
    Repeat Keyword    4    Log    Vamos logar essa fase 4 vezes!

*** Test cases ***
Cenário1: Preencher formulario de cadastro
    1 - Usando FOR com RANGE
    2 - Usando FOR com LISTA
    3 - Saindo de um FOR
    4 - Usando a keyword REPEAT
