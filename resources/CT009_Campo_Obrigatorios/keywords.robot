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

Validar Tela de Clientes
    [Documentation]    Valida que a página "Gestão de Clientes" foi carregada corretamente após login.
    Wait Until Element Is Visible    ${XPATH_GESTAO_CLIENTES}    timeout=10s
    Page Should Contain Element    ${XPATH_GESTAO_CLIENTES}

Acessar Aba de Cadastro de Cliente
    [Documentation]    Acessa a página de cadastro de cliente.
    Click Element    ${XPATH_CADASTRAR_CLIENTE}

Preencher Nome Completo
    [Documentation]    Preenche o campo "Nome Completo" no formulário de cadastro de cliente.
    Input Text    ${XPATH_NOME_COMPLETO}    ${NOME_CLIENTE}

Preencher Telefone
    [Documentation]    Preenche o campo "Telefone" no formulário de cadastro de cliente.
    Input Text    ${XPATH_TELEFONE}    ${TELEFONE_CLIENTE}

Preencher E-mail
    [Documentation]    Preenche o campo "E-mail" no formulário de cadastro de cliente.
    Input Text    ${XPATH_EMAIL}    ${EMAIL_INVALIDO}

Preencher CEP
    [Documentation]    Preenche o campo "CEP" no formulário de cadastro de cliente.
    Input Text    ${XPATH_CEP}    ${CEP_CLIENTE}

Preencher Número da Residência
    [Documentation]    Preenche o campo "Número da residência" no formulário de cadastro de cliente.
    Input Text    ${XPATH_NUMERO_RESIDENCIA}    ${NUMERO_RESIDENCIA}

Preencher Endereço
    [Documentation]    Preenche o campo "Endereço" no formulário de cadastro de cliente.
    Input Text    ${XPATH_ENDERECO}    ${RUA_CLIENTE}
    
Preencher Complemento
    [Documentation]    Preenche o campo "Complemento" no formulário de cadastro de cliente.
    Input Text    ${XPATH_COMPLEMENTO}    ${COMPLEMENTO_CLIENTE}

Adicionar Imagem
    [Documentation]    Faz o upload da imagem utilizando a keyword Choose File.
    Choose File    ${XPATH_UPLOAD_IMAGEM}    D:/Bruna Rosa/Prime/Cadastro/WebTesting/image/prime_control_logo.jpg

Selecionar País
    [Documentation]    Seleciona o país "Brasil" na caixa de seleção de países.
    Click Element    ${XPATH_PAIS}      # Clica na caixa de seleção para abrir as opções
    Wait Until Element Is Visible    ${XPATH_PAIS_BRASIL}    timeout=10s  # Aguarda até que o Brasil esteja visível
    Click Element    ${XPATH_PAIS_BRASIL}  # Clica no país Brasil
    Sleep    2s

Swipe Para Baixo
    [Documentation]    Rola a tela para baixo
    Execute Javascript    window.scrollBy(0, 500);  # Rola 500px para baixo
    Execute Javascript    window.scrollBy(0, 500);  # Rola 500px para baixo

Selecionar Gênero
    [Documentation]    Seleciona o gênero no campo "Selecione seu gênero" do formulário de cadastro de cliente.    
    Wait Until Element Is Visible    ${XPATH_GENERO}    timeout=10s
    Click Element    ${XPATH_GENERO}
    Wait Until Element Is Visible    ${XPATH_GENERO_FEMININO}    timeout=10s
    Click Element    ${XPATH_GENERO_FEMININO}
    Sleep    2s
    Execute Javascript    window.scrollBy(0, 500);  # Rola 500px para baixo
    Execute Javascript    window.scrollBy(0, 500);  # Rola 500px para baixo
    Sleep    5s

Selecionar Ferramentas
    [Documentation]    Seleciona as ferramentas que o cliente conhece (várias opções podem ser selecionadas).
    Click Element    ${XPATH_ROBOT}
    Click Element    ${XPATH_SELENIUM}
    Click Element    ${XPATH_CYPRESS}
    Click Element    ${XPATH_APPIUM}

VerificarEAdicionarBotaoSalvar
    [Documentation]    Verifica se o botão "Salvar" está visível na tela.
    Wait Until Element Is Visible    ${XPATH_SALVAR}    timeout=10s  # Aguarda o botão ser visível
    Log To Console    O botão "Salvar" foi encontrado na tela.
    Sleep    3s

Clicar em Salvar
    [Documentation]    Clica no botão "Salvar" para finalizar o cadastro de cliente.
    Click Element    ${XPATH_SALVAR}
    Sleep    2s
      
Campos Obrigatórios
    [Documentation]    Clica no botão "Salvar" e verifica se o alerta com a mensagem de erro é exibido.
    Click Element    ${XPATH_SALVAR}
    Sleep    2s   # Aguarda o alerta aparecer após clicar no botão "Salvar"
    
    # Verifica se o alerta está presente e depois lida com ele
    Wait Until Keyword Succeeds    1x    2s    Handle Alert    action=accept   # Aceita o alerta
    Log    O alerta foi aceito.

