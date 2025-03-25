*** Settings ***
Library        SeleniumLibrary
Resource       ../resources/variables/variable.resource
Resource       ../resources/CT001_Conta_Nova/keywords.robot
Test Setup      Abrir o Navegador
Test Teardown   Fechar o Navegador

*** Test Cases ***
CT001 - Criar uma nova Conta com sucesso
    [Documentation]    Teste para criar uma nova conta com sucesso.
    ...                O usuário deve preencher um email e senha válidos e cadastrar.
    [Tags]             cadastro    positivo    smoke

    Acessar Tela de Cadastro
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Confirmar Dados de Cadastro
    