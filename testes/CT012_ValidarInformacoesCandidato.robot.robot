*** Settings ***
Library        SeleniumLibrary
Resource       ../resources/variables/variable.resource
Resource       ../resources/CT012_Validar_Candidato/keywords.robot
Test Teardown   Fechar o Navegador

*** Test Cases ***
CT002 - Validar criação de uma conta com Email já cadastrado
    [Documentation]    Teste para validar Informações do candidato
    [Tags]             cadastro    negativo    regressivo

    Acessar Tela de Login
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Confirmar Dados de Cadastro
    Validar Tela de Clientes
    Validar Informações do Candidato e Enviar