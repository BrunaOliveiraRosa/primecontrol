describe('API Testes - /addCliente', () => {
  
    // CT001 - Teste de adição bem-sucedida
    it('CT001 - Adição bem-sucedida de cliente', () => {
      cy.request({
        method: 'POST',
        url: '/addCliente',
        body: {
          nome: 'Prime Control',
          email: 'challenge@primecontrol.com.br',
          fone: 41933002024,
          fotoPerfil: 'https://media.licdn.com/dms/image/v2/C4E0BAQEcr5g6MbO-EA/company-logo_200_200/company-logo_200_200/0/1630645917795/prime_control_logo?e=2147483647&v=beta&t=PAb7B62TOouPGsiFtq_AhBhSeZzc6Y1Mh9u_86fHFwY',
          cep: '80215-182',
          endereco: 'Imaculada Conceição, 1430',
          complemento: 'Predio',
          pais: 'Brasil',
          genero: 'Feminino',
          ferramentas: ['Cypress', 'Python', 'Robot']
        }
      }).then((response) => {
        expect(response.status).to.eq(201);
        expect(response.body.message).to.eq('Sucesso ao adicionar o cliente');
        expect(response.body.id).to.not.be.null;
      });
    });
  
    // CT002 - Teste de campos obrigatórios
    it('CT002 - Teste de campos obrigatórios', () => {
      cy.request({
        method: 'POST',
        url: '/addCliente',
        failOnStatusCode: false,  // Para permitir testar erro de validação
        body: {
          // Faltando o campo 'nome' (obrigatório)
          email: 'challenge@primecontrol.com.br',
          fone: 41933002024,
          fotoPerfil: 'https://media.licdn.com/dms/image/v2/C4E0BAQEcr5g6MbO-EA/company-logo_200_200/company-logo_200_200/0/1630645917795/prime_control_logo?e=2147483647&v=beta&t=PAb7B62TOouPGsiFtq_AhBhSeZzc6Y1Mh9u_86fHFwY',
          cep: '80215-182',
          endereco: 'Imaculada Conceição, 1430',
          complemento: 'Predio',
          pais: 'Brasil',
          genero: 'Feminino',
          ferramentas: ['Cypress', 'Python', 'Robot']
        }
      }).then((response) => {
        expect(response.status).to.eq(400);  // Espera um erro devido ao campo 'nome' ausente
        expect(response.body.message).to.eq('Erro: campo "nome" é obrigatório');
      });
    });
  
    // CT003 - Teste de validação do e-mail e URL do perfil
    it('CT003 - Teste de validação de e-mail e URL', () => {
      cy.request({
        method: 'POST',
        url: '/addCliente',
        failOnStatusCode: false,  // Para permitir testar erro de validação
        body: {
          nome: 'Prime Control',
          email: 'invalid-email',  // E-mail inválido
          fone: 41933002024,
          fotoPerfil: 'invalid-url',  // URL inválida
          cep: '80215-182',
          endereco: 'Imaculada Conceição, 1430',
          complemento: 'Predio',
          pais: 'Brasil',
          genero: 'Feminino',
          ferramentas: ['Cypress', 'Python', 'Robot']
        }
      }).then((response) => {
        expect(response.status).to.eq(400);  // Espera erro de validação
        expect(response.body.message).to.eq('Erro: e-mail inválido ou URL do perfil inválida');
      });
    });
  
  });