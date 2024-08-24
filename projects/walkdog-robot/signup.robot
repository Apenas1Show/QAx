*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Library        Browser

*** Test Cases ***
Deve poder cadastrar um dog walker
    
    ${name}               Set Variable    Rafael Bertolai
    ${email}              Set Variable    rafaelbertolai2@gmail.com
    ${cpf}                Set Variable    00000014141
    ${cep}                Set Variable    05564200
    ${addressStreet}      Set Variable    Avenida Engenheiro Heitor Antônio Eiras Garcia
    ${addressDistrict}    Set Variable    Jardim Esmeralda
    ${addressCityUf}      Set Variable    São Paulo/SP
    ${addressNumber}      Set Variable    6280
    ${addressDetails}     Set Variable    CASA 6
    ${cnh}                Set Variable    toretto.jpg

    Abertura da pagina de cadastro de walkdog
    Preencher os dados do formulario    ${name}           ${email}          ${cpf}            ${cep}            ${addressStreet}  ${addressDistrict}    ${addressCityUf}      ${addressNumber}      ${addressDetails}     ${cnh}
    Enviar formulario
    Validar mensagem de sucesso    Recebemos o seu cadastro e em breve retornaremos o contato.
    Screenshot do teste finalizado

*** Keywords ***
Abertura da pagina de cadastro de walkdog
    New Browser     browser=chromium    headless=False
    New Page        https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1    equal      Faça seu cadastro

Preencher os dados do formulario
    [Arguments]    ${name}           ${email}          ${cpf}            ${cep}            ${addressStreet}  ${addressDistrict}    ${addressCityUf}      ${addressNumber}      ${addressDetails}     ${cnh}            

    Fill Text            css=input[name=name]            ${name}    
    Fill Text            css=input[name=email]           ${email}
    Fill Text            css=input[name=cpf]             ${cpf}        
    Fill Text            css=input[name=cep]             ${cep}  

    Click    css=input[type=button][value$=CEP]
    
    Get Property    css=input[name=addressStreet]        value    equal    ${addressStreet}
    Get Property    css=input[name=addressDistrict]      value    equal    ${addressDistrict}
    Get Property    css=input[name=addressCityUf]        value    equal    ${addressCityUf}
    
    Fill Text            css=input[name=addressNumber]   ${addressNumber}   
    Fill Text            css=input[name=addressDetails]  ${addressDetails}       

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/${cnh}

Enviar formulario
    Click    css=.button-register    

Validar mensagem de sucesso
    [Arguments]    ${sucessMessage}
    Wait For Elements State    css=#swal2-html-container    visible    5
    Get Text                   css=#swal2-html-container    equal      ${sucessMessage}

Screenshot do teste finalizado
    Take Screenshot    fullPage=True