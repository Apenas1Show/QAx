*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Library        Browser

*** Test Cases ***
Deve poder cadastrar um dog walker
    
    ${dog_walker}         Create Dictionary    
    ...    name=Rafael Bertolai
    ...    email=rafaelbertolai2@gmail.com
    ...    cpf=00000014141
    ...    cep=05564200
    ...    street=Avenida Engenheiro Heitor Antônio Eiras Garcia
    ...    district=Jardim Esmeralda
    ...    city_uf=São Paulo/SP
    ...    number=6278
    ...    details=Casa 6
    ...    cnh=toretto.jpg

    Abertura da pagina de cadastro de walkdog
    Preencher os dados do formulario    ${dog_walker} 
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
    [Arguments]   ${dog_walker}       

    Fill Text            css=input[name=name]            ${dog_walker}[name]    
    Fill Text            css=input[name=email]           ${dog_walker}[email]
    Fill Text            css=input[name=cpf]             ${dog_walker}[cpf]       
    Fill Text            css=input[name=cep]             ${dog_walker}[cep]  

    Click    css=input[type=button][value$=CEP]
    
    Get Property    css=input[name=addressStreet]        value    equal    ${dog_walker}[street]
    Get Property    css=input[name=addressDistrict]      value    equal    ${dog_walker}[district]
    Get Property    css=input[name=addressCityUf]        value    equal    ${dog_walker}[city_uf]
    
    Fill Text            css=input[name=addressNumber]   ${dog_walker}[number]   
    Fill Text            css=input[name=addressDetails]  ${dog_walker}[details]       

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/${dog_walker}[cnh]

Enviar formulario
    Click    css=.button-register    

Validar mensagem de sucesso
    [Arguments]    ${sucessMessage}
    Wait For Elements State    css=#swal2-html-container    visible    5
    Get Text                   css=#swal2-html-container    equal      ${sucessMessage}

Screenshot do teste finalizado
    Take Screenshot    fullPage=True