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

Acessar Tela de Cadastro
    [Documentation]    Clica no botão "Criar uma conta" para acessar a tela de cadastro.
    Wait Until Element Is Visible   ${CRIAR_CONTA_XPATH}    timeout=10s
    Wait Until Element Is Enabled   ${CRIAR_CONTA_XPATH}    timeout=5s
    Click Element   ${CRIAR_CONTA_XPATH}
    
    
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
    Wait Until Element Is Visible    ${XPATH_BOTAO_CRIAR_CONTA}    timeout=10s
    Click Element    ${XPATH_BOTAO_CRIAR_CONTA}        
    Sleep    10s

Validar que a mensagem de erro aparece (e-mail em uso)
    [Documentation]    Valida que a mensagem de erro "Esse email já está em uso por outra conta"
    Wait Until Element Is Visible    ${XPATH_ALERTA_EMAIL_EM_USO}    timeout=10s
    Element Text Should Be   ${XPATH_ALERTA_EMAIL_EM_USO}     Esse email já está em uso por outra conta