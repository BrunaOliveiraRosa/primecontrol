describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://challenge.primecontrol.com.br/')
    cy.get('.btn-dark').click()
    cy.get('#floatingInput').type('challenge@primecontrol.com.br')
    cy.get('#floatingPassword').type('41933002024')
    cy.get('.w-100').click()
  })
})