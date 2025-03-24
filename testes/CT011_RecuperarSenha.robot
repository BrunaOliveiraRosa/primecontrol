*** Settings ***
Library        SeleniumLibrary
Resource       ../resources/variables/variable.resource
Resource       ../resources/CT011_Recuperar_Senha/keywords.robot
Documentation   Esta suite testa o cadastro de Clientes
Test Setup      Abrir o Navegador
Test Teardown   Fechar o Navegador

*** Test Cases ***
CT002 - Validar criação de uma conta com Email já cadastrado
    [Documentation]    Teste para validar erro ao tentar criar uma conta com um email já cadastrado.
    [Tags]             cadastro    negativo    regressivo

    Acessar Tela de Login
    Recuperar Senha