*** Settings ***
Documentation        Ações, steps e elementos da funcionalidade de cadastro

Library    Browser

*** Keywords *** 
Abertura da pagina de cadastro de walkdog
    Click    css=a[href="/signup"]

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

    Click    xpath=//span[text()="${dog_walker}[additional_service]"]/..    
    Take Screenshot    selector=//span[text()="${dog_walker}[additional_service]"]/..

    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Enviar formulario
    Click    css=.button-register    

Validar mensagem de sucesso
    [Arguments]    ${sucessMessage}
    Wait For Elements State    css=#swal2-html-container    visible    5
    Get Text                   css=#swal2-html-container    equal      ${sucessMessage}

Alert should be
    [Arguments]    ${alert-error}

    Wait For Elements State    css=.alert-error >> text=${alert-error}
    ...    visible    5   