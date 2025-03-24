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
        
Preencher Campo de E-mail
    [Documentation]    Clica no campo de e-mail e insere o e-mail cadastrado.
    Wait Until Element Is Visible   ${XPATH_ENTRADA_EMAIL}    timeout=10s
    Input Text        ${XPATH_ENTRADA_EMAIL}    ${EMAIL_INVALIDO}
    
Preencher Campo de Senha
    [Documentation]    Clica no campo de e-mail e insere o e-mail cadastrado.
    Wait Until Element Is Visible   ${XPATH_CAMPO_SENHA}    timeout=10s
    Input Text        ${XPATH_CAMPO_SENHA}    ${SENHA_INVALIDO}


Confirmar Dados de Cadastro
    [Documentation]    Preenche os campos de email e senha no formulário de cadastro.
    Wait Until Element Is Visible    ${XPATH_BOTAO_ACESSAR}    timeout=10s
    Click Element    ${XPATH_BOTAO_ACESSAR}        
    Sleep    5s

Confirmar Falha de Senha
    [Documentation]    Valida que a mensagem de erro "E-mail ou senha inválida" é exibida.
    Wait Until Element Is Visible   ${MENSAGEM_ERRO_SENHA_INVALIDA}    timeout=10s
    Element Text Should Be   ${MENSAGEM_ERRO_SENHA_INVALIDA}    E-mail ou senha inválida.
