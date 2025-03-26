describe('template spec', () => {
    it('passes', () => {
      cy.visit('https://challenge.primecontrol.com.br/')
      cy.get('.btn-outline-light').click()
      cy.get('#floatingInput').type('challenge@primecontrol.com.br')
      cy.get('#floatingPassword').type('41933002024')
      cy.get('.w-100').click()
      cy.get('h1')
      cy.get(':nth-child(2) > .nav-link').click()

  
    })
  })