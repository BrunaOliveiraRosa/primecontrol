*** Settings ***
Library        SeleniumLibrary
Resource       ../resources/variables/variable.resource
Resource       ../resources/CT003_Login_Ok/keywords.robot
Test Setup      Abrir o Navegador
Test Teardown   Fechar o Navegador

*** Test Cases ***
CT002 - Validar criação de uma conta com Email já cadastrado
    [Documentation]    Teste para validar o cadastro de Clientes
    [Tags]             cadastro    negativo    regressivo

    Acessar Tela de Login
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Confirmar Dados de Cadastro
    Validar Tela de Clientes