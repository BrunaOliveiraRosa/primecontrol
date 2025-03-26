describe('API Testes - /deleteClient/{id}', () => {

    // CT001 - Teste de exclusão bem-sucedida
    it('CT001 - Exclusão bem-sucedida de cliente', () => {
      cy.request({
        method: 'DELETE',
        url: '/deleteClient/validId', // Substitua com um ID válido
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body.message).to.eq('Cliente excluido com sucesso!');
      });
    });
  
    // CT002 - Teste de cliente não encontrado
    it('CT002 - Cliente não encontrado', () => {
      cy.request({
        method: 'DELETE',
        url: '/deleteClient/invalidId', // Substitua com um ID inválido
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(404);
        expect(response.body.message).to.eq('Cliente não encontrado.');
      });
    });
  
    // CT003 - Teste de exclusão sem ID
    it('CT003 - Exclusão sem ID fornecido', () => {
      cy.request({
        method: 'DELETE',
        url: '/deleteClient/', // Sem ID
        failOnStatusCode: false
      }).then((response) => {
        expect(response.status).to.eq(400); // ou outro código de erro relevante
        expect(response.body.message).to.include('ID é obrigatório');
      });
    });
  });
  