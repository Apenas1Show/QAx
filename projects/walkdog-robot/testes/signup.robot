*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve poder cadastrar um dog walker
    [Tags]    smoke

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

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    Abertura da pagina de cadastro de walkdog
    Enviar formulario
    Alert should be     Informe o seu nome completo
    Alert should be     Informe o seu melhor email
    Alert should be     Informe o seu CPF
    Alert should be     Informe o seu CEP
    Alert should be     Informe um número maior que zero
    Alert should be     Adcione um documento com foto (RG ou CHN)

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

    Abertura da pagina de cadastro de walkdog
    Preencher os dados do formulario    ${dog_walker}
    Enviar formulario

Deve poder cadastrar um dog walker que sabe cuidar de pets
    [Tags]    aservice

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
    Additional Service    Cuidar
    Enviar formulario
    Validar mensagem de sucesso    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um dog walker que sabe adestrar pets
    [Tags]    aservice

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
    Additional Service    Adestrar
    Enviar formulario
    Validar mensagem de sucesso    Recebemos o seu cadastro e em breve retornaremos o contato.