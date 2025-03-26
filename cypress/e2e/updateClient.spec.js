describe('API Testes - /updateClient/{id}', () => {

    // CT001 - Teste de atualização bem-sucedida
    it('CT001 - Atualização bem-sucedida de cliente', () => {
      cy.request({
        method: 'PUT',
        url: '/updateClient/validId', // Substitua com um ID válido
        body: {
          nome: 'Novo Nome',
          email: 'novoemail@example.com',
          fone: 123456789,
          fotoPerfil: 'http://valid-url.com/image.jpg'
        },
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body.message).to.eq('Cliente atualizado com sucesso!');
      });
    });
  
    // CT002 - Teste de cliente não encontrado
    it('CT002 - Cliente não encontrado para atualização', () => {
      cy.request({
        method: 'PUT',
        url: '/updateClient/invalidId', // Substitua com um ID inválido
        body: {
          nome: 'Novo Nome'
        },
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(404);
        expect(response.body.message).to.eq('Cliente não encontrado.');
      });
    });
  
    // CT003 - Teste de atualização sem campos
    it('CT003 - Atualização sem campos fornecidos', () => {
      cy.request({
        method: 'PUT',
        url: '/updateClient/validId', // Substitua com um ID válido
        body: {}, // Sem campos
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(400); // ou outro código de erro relevante
        expect(response.body.message).to.include('Campos obrigatórios');
      });
    });
  });
  