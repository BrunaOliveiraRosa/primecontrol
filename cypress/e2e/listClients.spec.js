describe('API Testes - /listClients', () => {

    // CT001 - Teste de resposta bem-sucedida
    it('CT001 - Resposta bem-sucedida na listagem de clientes', () => {
      cy.request({
        method: 'GET',
        url: '/listClients'
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.be.an('array');
        
        // Validando o primeiro item da lista com base no formato que você forneceu
        const cliente = response.body[0];
        expect(cliente).to.have.property('id').and.be.a('string');
        expect(cliente).to.have.property('nome').and.eq('Prime Control');
        expect(cliente).to.have.property('email').and.eq('challenge@primecontrol.com.br');
        expect(cliente).to.have.property('fone').and.eq('41933002024');
        expect(cliente).to.have.property('fotoPerfil').and.match(/^https?:\/\/[^\s$.?#].[^\s]*$/);
      });
    });
  
    // CT002 - Teste de validação dos campos
    it('CT002 - Validação dos campos na lista de clientes', () => {
      cy.request({
        method: 'GET',
        url: '/listClients'
      }).then((response) => {
        const cliente = response.body[0]; // Assumindo que ao menos 1 cliente existe
        expect(cliente).to.have.property('id').and.be.a('string');
        expect(cliente).to.have.property('nome').and.be.a('string');
        expect(cliente).to.have.property('email').and.be.a('string');
        expect(cliente).to.have.property('fone').and.be.a('string');  // Alterado para string, conforme o seu formato
        expect(cliente).to.have.property('fotoPerfil').and.match(/^https?:\/\/[^\s$.?#].[^\s]*$/);
      });
    });
  });
  
  