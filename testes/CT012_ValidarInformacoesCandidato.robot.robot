*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/variable.resource

*** Test Cases ***
CT012 - Validar preenchimento "Informações do Candidato" ao clicar em "Finalizar e Enviar"
    [Documentation]    Teste para validar que todas as informações obrigatórias do candidato foram preenchidas antes do envio.
    [Tags]             validacao    candidato    negativo    funcional

    Open Browser    ${URL}/informacoes_candidato    chrome
    Click Button    id=finalizar_enviar
    Page Should Contain    Campos obrigatórios não preenchidos
    Close Browser