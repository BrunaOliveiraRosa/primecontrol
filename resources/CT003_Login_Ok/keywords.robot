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
    Input Text        ${XPATH_ENTRADA_EMAIL}    ${EMAIL_VALIDO}
    
Preencher Campo de Senha
    [Documentation]    Clica no campo de e-mail e insere o e-mail cadastrado.
    Wait Until Element Is Visible   ${XPATH_CAMPO_SENHA}    timeout=10s
    Input Text        ${XPATH_CAMPO_SENHA}    ${SENHA_VALIDO}


Confirmar Dados de Cadastro
    [Documentation]    Preenche os campos de email e senha no formulário de cadastro.
    Wait Until Element Is Visible    ${XPATH_BOTAO_ACESSAR}    timeout=10s
    Click Element    ${XPATH_BOTAO_ACESSAR}        
    Sleep    10s

Validar Tela de Clientes
    [Documentation]    Valida que a página "Gestão de Clientes" foi carregada corretamente após login.
    Wait Until Element Is Visible    ${XPATH_GESTAO_CLIENTES}    timeout=10s
    Page Should Contain Element    ${XPATH_GESTAO_CLIENTES}