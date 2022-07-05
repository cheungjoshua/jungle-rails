/// <reference types="cypress" />

describe("Navigation", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to product", () => {
    cy.contains("Add").first().click();
    cy.get(".nav-link").contains("(1)").should("exist");
  });
});
