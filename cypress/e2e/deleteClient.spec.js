describe('API Testes - /deleteClient', () => {

    // CT001 - Teste de exclusão bem-sucedida
    it('CT001 - Exclusão bem-sucedida de cliente', () => {
      const clientId = 'UCcCXgzFmVisNQZitZCr'; // Substitua com um ID válido de cliente
      cy.request({
        method: 'DELETE',
        url: `/deleteClient/${clientId}`,
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body.message).to.eq('Cliente excluido com sucesso!');
      });
    });
  
    // CT002 - Teste de cliente não encontrado
    it('CT002 - Cliente não encontrado ao excluir', () => {
      const invalidClientId = 'invalid-client-id';
      cy.request({
        method: 'DELETE',
        url: `/deleteClient/${invalidClientId}`,
        failOnStatusCode: false  // Para permitir testar erro de cliente não encontrado
      }).then((response) => {
        expect(response.status).to.eq(404);
        expect(response.body.message).to.eq('Cliente não encontrado.');
      });
    });
  
    // CT003 - Teste de exclusão sem ID
    it('CT003 - Tentativa de exclusão sem ID', () => {
      cy.request({
        method: 'DELETE',
        url: '/deleteClient/',
        failOnStatusCode: false  // Para permitir testar erro de falta de ID
      }).then((response) => {
        expect(response.status).to.eq(400);
        expect(response.body.message).to.eq('Erro: ID do cliente é obrigatório para exclusão');
      });
    });
  
  });