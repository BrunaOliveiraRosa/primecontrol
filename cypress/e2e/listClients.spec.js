describe('API Testes - /listClients', () => {

    // CT001 - Teste de resposta bem-sucedida
    it('CT001 - Resposta bem-sucedida ao listar clientes', () => {
      cy.request({
        method: 'GET',
        url: '/listClients',
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.be.an('array');  // Verifica se a resposta é uma lista de clientes
        expect(response.body[0]).to.have.property('id');
        expect(response.body[0]).to.have.property('nome');
        expect(response.body[0]).to.have.property('email');
      });
    });
  
    // CT002 - Teste de validação dos campos
    it('CT002 - Validação dos campos ao listar clientes', () => {
      cy.request({
        method: 'GET',
        url: '/listClients',
      }).then((response) => {
        expect(response.status).to.eq(200);
        response.body.forEach(client => {
          expect(client).to.have.property('id').and.to.be.a('string');
          expect(client).to.have.property('nome').and.to.be.a('string');
          expect(client).to.have.property('email').and.to.be.a('string');
          expect(client).to.have.property('fone').and.to.be.a('number');
          expect(client).to.have.property('fotoPerfil').and.to.be.a('string');
        });
      });
    });
  
  });
  
  