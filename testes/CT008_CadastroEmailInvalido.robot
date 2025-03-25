*** Settings ***
Library        SeleniumLibrary
Resource       ../resources/variables/variable.resource
Resource       ../resources/CT008_E-mail_Cadastro_NOK/keywords.robot
Test Setup      Abrir o Navegador
Test Teardown   Fechar o Navegador


*** Test Cases ***
CT005 - Realizar Cadastro de Clientes com sucesso
    [Documentation]    Teste para Email Invalido
    [Tags]             cadastro    positivo

    Acessar Tela de Login
    Preencher Campo de E-mail
    Preencher Campo de Senha
    Confirmar Dados de Cadastro
    Validar Tela de Clientes
    Acessar Aba de Cadastro de Cliente
    Preencher Nome Completo
    Preencher Telefone
    Preencher E-mail
    Preencher CEP
    Preencher Número da Residência
    Preencher Endereço
    Preencher Complemento
    Adicionar Imagem
    Swipe Para Baixo
    Selecionar País
    Selecionar Gênero
    Selecionar Ferramentas
    VerificarEAdicionarBotaoSalvar
    Clicar em Salvar
    Mostrar Mensagem E-mail Inválido