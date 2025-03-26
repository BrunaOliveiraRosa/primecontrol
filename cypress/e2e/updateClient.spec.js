describe('API Testes - /updateClient', () => {

    // CT001 - Teste de atualização bem-sucedida
    it('CT001 - Atualização bem-sucedida de cliente', () => {
      const clientId = 'UCcCXgzFmVisNQZitZCr'; // Substitua com um ID válido de cliente
      cy.request({
        method: 'PUT',
        url: `/updateClient/${clientId}`,
        body: {
          nome: 'Novo Nome do Cliente',
          email: 'novoemail@exemplo.com',
          fone: 41933002025,
          fotoPerfil: 'https://nova-imagem.com/imagem.jpg'
        }
      }).then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body.message).to.eq('Cliente atualizado com sucesso!');
      });
    });
  
    // CT002 - Teste de cliente não encontrado
    it('CT002 - Cliente não encontrado ao atualizar', () => {
      const invalidClientId = 'invalid-client-id';
      cy.request({
        method: 'PUT',
        url: `/updateClient/${invalidClientId}`,
        failOnStatusCode: false,  // Para permitir testar erro de cliente não encontrado
        body: {
          nome: 'Novo Nome do Cliente',
          email: 'novoemail@exemplo.com',
          fone: 41933002025,
          fotoPerfil: 'https://nova-imagem.com/imagem.jpg'
        }
      }).then((response) => {
        expect(response.status).to.eq(404);
        expect(response.body.message).to.eq('Cliente não encontrado.');
      });
    });
  
    // CT003 - Teste de atualização sem campos
    it('CT003 - Tentativa de atualização sem campos', () => {
      const clientId = 'UCcCXgzFmVisNQZitZCr'; // Substitua com um ID válido de cliente
      cy.request({
        method: 'PUT',
        url: `/updateClient/${clientId}`,
        failOnStatusCode: false,  // Para permitir testar erro de falta de campos
        body: {}
      }).then((response) => {
        expect(response.status).to.eq(400);
        expect(response.body.message).to.eq('Erro: pelo menos um campo deve ser fornecido para atualização');
      });
    });
  
  });
  