describe('API Testes - /addCliente', () => {

    // CT001 - Teste de adição bem-sucedida
    it('CT001 - Adição bem-sucedida de cliente', () => {
      cy.request({
        method: 'POST',
        url: '/addCliente',
        body: {
          nome: 'Novo Cliente',
          email: 'cliente@example.com',
          fone: 123456789,
          fotoPerfil: 'http://valid-url.com/image.jpg',
          cep: '12345-678',
          endereco: 'Rua Exemplo, 123',
          complemento: 'Apto 101',
          pais: 'Brasil',
          genero: 'Masculino',
          ferramentas: ['Cypress']
        }
      }).then((response) => {
        expect(response.status).to.eq(201);
        expect(response.body.message).to.eq('Sucesso ao adicionar o cliente');
        expect(response.body.id).to.not.be.null;
      });
    });
  
    // CT002 - Teste de campos obrigatórios
    it('CT002 - Falta de campo obrigatório', () => {
      cy.request({
        method: 'POST',
        url: '/addCliente',
        body: {
          email: 'cliente@example.com',
          fone: 123456789
          // Sem "nome"
        },
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(400);
        expect(response.body.message).to.include('Campo "nome" é obrigatório');
      });
    });
  
    // CT003 - Teste de validação do e-mail e URL do perfil
    it('CT003 - Validação do e-mail e URL', () => {
      cy.request({
        method: 'POST',
        url: '/addCliente',
        body: {
          nome: 'Novo Cliente',
          email: 'invalidemail',
          fone: 123456789,
          fotoPerfil: 'invalid-url',
          cep: '12345-678',
          endereco: 'Rua Exemplo, 123',
          complemento: 'Apto 101',
          pais: 'Brasil',
          genero: 'Masculino',
          ferramentas: ['Cypress']
        },
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(400);
        expect(response.body.message).to.include('Formato de e-mail inválido');
        expect(response.body.message).to.include('URL de foto inválida');
      });
    });
  });
  