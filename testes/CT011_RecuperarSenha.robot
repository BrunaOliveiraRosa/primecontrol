*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variable.resource

*** Test Cases ***
CT011 - Recuperar senha de acesso
    [Documentation]    Teste para validar o fluxo de recuperação de senha do usuário.
    [Tags]             recuperar_senha    login    positivo    funcional

    Open Browser    ${URL}/recuperar_senha    chrome
    Input Text    id=email    ${EMAIL_CADASTRADO}
    Click Button    id=enviar_recuperacao
    Page Should Contain    Instruções para redefinição enviadas ao seu email
    Close Browser
