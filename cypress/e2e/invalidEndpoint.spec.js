describe('API Testes - Endpoint Inexistente', () => {

    // CT003 - Teste de endpoint inexistente
    it('CT003 - Teste de endpoint inexistente /listClientsInvalid', () => {
      cy.request({
        method: 'GET',
        url: '/listClientsInvalid',  // Endpoint que não existe
        failOnStatusCode: false  // Para permitir testar erro 404
      }).then((response) => {
        expect(response.status).to.eq(404);
        expect(response.body.message).to.eq('Endpoint não encontrado');
      });
    });
  
  });