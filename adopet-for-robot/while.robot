*** Variables ***
${COUNT}    0

*** Keywords ***
5 - Usando o While Loop
    WHILE    ${COUNT} < 5
        Log    O contador é: ${COUNT}
        ${COUNT}=    Evaluate    ${COUNT} + 1
    END

*** Test cases ***
Cso de teste FOR
    5 - Usando o While Loop