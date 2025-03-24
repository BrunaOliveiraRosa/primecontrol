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
    Sleep    5s

Validar Tela de Clientes
    [Documentation]    Valida que a página "Gestão de Clientes" foi carregada corretamente após login.
    Wait Until Element Is Visible    ${XPATH_GESTAO_CLIENTES}    timeout=5s
    Page Should Contain Element    ${XPATH_GESTAO_CLIENTES}

  
Editar Cliente
    [Documentation]    Edita o nome do cliente e salva as alterações.
    Wait Until Element Is Visible    ${XPATH_ICONE_EDICAO}    timeout=10s
    Click Element    ${XPATH_ICONE_EDICAO}    # Clica no ícone de editar
    Wait Until Element Is Visible    ${XPATH_NOME_INPUT}    timeout=10s
    Click Element    ${XPATH_NOME_INPUT}    # Clica no campo para garantir que ele está selecionado
    Clear Element Text    ${XPATH_NOME_INPUT}    # Limpa o campo de nome
    Input Text    ${XPATH_NOME_INPUT}    ${NOME_EDITADO}    # Edita o nome
    Sleep    5s
    Execute Javascript    window.scrollBy(0, 500);  # Rola 500px para baixo
    Execute Javascript    window.scrollBy(0, 500);  # Rola 500px para baixo
    Sleep    5s
    Click Element    //button[normalize-space()='Salvar']    # Clica no botão de salvar
    Sleep    5s