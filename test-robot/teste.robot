** Settings **
Library    SeleniumLibrary


** Variables **

${url}    https://robotframework.org/

** Keywords **
Open Robot site
    Open Browser    ${url} chrome

** Test Cases **
Cenario 1: Test Robot
    Open Robot site
    Close Browser
