*** Settings ***
Library   Browser

*** Test Cases ***
Deve tocar uma musica
    New Browser    browser=chromium    headless=False
    New Page    https://parodify.vercel.app
    Get Text    css=.logged-user    contains    Fernando Papito

    Sleep    2