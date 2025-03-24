*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variable.resource

*** Test Cases ***
CT009 - Validar preenchimento de campos obrigatórios na aba Perfil
    [Documentation]    Teste para validar que os campos obrigatórios devem ser preenchidos antes do cadastro.
    [Tags]             validacao    cliente    negativo    funcional

    Open Browser    ${URL}/perfil    chrome
    Click Button    id=cadastrar_cliente
    Page Should Contain    Campos obrigatórios não preenchidos
    Close Browser