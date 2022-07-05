/// <reference types="cypress" />

describe("shopping cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There should add item to cart", () => {
    cy.contains("Add").first().click();
    cy.get(".nav-link").contains("(1)").should("exist");
  });
});
