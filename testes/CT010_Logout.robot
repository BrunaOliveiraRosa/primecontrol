*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variable.resource

*** Test Cases ***
CT010 - Realizar Logout com sucesso ao clicar em "Finalizar"
    [Documentation]    Teste para validar que o usuário consegue sair do sistema corretamente.
    [Tags]             logout    positivo    smoke

    Open Browser    ${URL}/dashboard    chrome
    Click Button    id=finalizar
    Page Should Contain    Você saiu do sistema
    Close Browser