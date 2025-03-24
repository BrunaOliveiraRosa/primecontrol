*** Settings ***
Library        SeleniumLibrary
Resource       ../variables/variable.resource



*** Keywords ***

Abrir o Navegador
    [Documentation]    Abre o navegador e maximiza a janela.
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window

Fechar o Navegador
    [Documentation]    Fecha o navegador.
    Close Browser

Acessar Tela de Login
    [Documentation]    Clica no botão "Criar uma conta" para acessar a tela de cadastro.
    Wait Until Element Is Visible   ${XPATH_FAZER_LOGIN}    timeout=10s
    Wait Until Element Is Enabled   ${XPATH_FAZER_LOGIN}    timeout=5s
    Click Element   ${XPATH_FAZER_LOGIN}
    Sleep    5s

Recuperar Senha
    [Documentation]    Realiza o processo de recuperação de senha.
    Wait Until Element Is Visible    ${XPATH_ESQUECI_MINHA_SENHA}    timeout=10s
    Click Element    ${XPATH_ESQUECI_MINHA_SENHA}    # Clica no link "Esqueci minha senha"
    Sleep    5s
    Wait Until Element Is Visible    ${XPATH_CAMPO_EMAIL}    timeout=5s
    Input Text    ${XPATH_CAMPO_EMAIL}    ${EMAIL_TEXTO}    # Preenche o e-mail
    Sleep    5s
    Wait Until Element Is Visible    ${XPATH_BOTAO_ENVIAR}    timeout=5s
    Click Element    ${XPATH_BOTAO_ENVIAR}    # Clica no botão "Enviar"
    Sleep    5s
    Log To Console    Solicitação de recuperação de senha enviada para ${EMAIL_TEXTO}.
