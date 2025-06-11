** Settings **
Library    SeleniumLibrary

** Variables **

${url_google}    https://www.google.com

${url_globo}    https://www.globo.com

** Keywords **
Open Google site
    Open Browser    ${url_google}    chrome

Open Globo site
    Open Browser    ${url_globo}    chrome

** Test Cases **
Cenario 1: Test Google
    Open Google site
    Close Browser

Cenario 2: Test Globo
    Open Globo site
    Close Browser

