*** Settings ***
Resource    keywords.resource

*** Test Cases ***
Cenário 1: Inserir dados cadastro
    FOR    ${i}    IN    RANGE    ${quantidade}
        Cadastrar Usuário
    END