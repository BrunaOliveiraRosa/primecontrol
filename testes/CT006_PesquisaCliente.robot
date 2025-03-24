*** Settings ***
Library        SeleniumLibrary
Resource       ../resources/variables/variable.resource
Resource       ../resources/CT006_Encontrar_Cliente/keywords.robot
Documentation   Esta suite testa o cadastro de Clientes
Test Setup      Abrir o Navegador
Test Teardown   Fechar o Navegador

*** Test Cases ***
CT002 - Validar criação de uma conta com Email já cadastrado
    [Documentation]    Teste para validar erro ao tentar criar uma conta com um email já cadastrado.
    [Tags]             cadastro    negativo    regressivo

    Acessar Tela de Login
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Confirmar Dados de Cadastro
    Validar Tela de Clientes
    Pesquisar Cliente
    Confirmar Pesquisa do Cliente
    Fechar Caixa de Pesquisa