*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

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

    Start session
    Abertura da pagina de cadastro de walkdog
    Preencher os dados do formulario    ${dog_walker}
    Enviar formulario
    Validar mensagem de sucesso    Recebemos o seu cadastro e em breve retornaremos o contato.
    Finish session

Não deve cadastrar se o cpf for incorreto
    [Tags]    cpf_inv

    ${dog_walker}         Create Dictionary    
    ...    name=Rafael Bertolai
    ...    email=rafaelbertolai2@gmail.com
    ...    cpf=000000141ss
    ...    cep=05564200
    ...    street=Avenida Engenheiro Heitor Antônio Eiras Garcia
    ...    district=Jardim Esmeralda
    ...    city_uf=São Paulo/SP
    ...    number=6278
    ...    details=Casa 6
    ...    cnh=toretto.jpg

    Start session
    Abertura da pagina de cadastro de walkdog
    Preencher os dados do formulario    ${dog_walker}
    Enviar formulario
    Finish session