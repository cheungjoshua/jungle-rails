/// <reference types="cypress" />

describe("Navigation", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to product", () => {
    cy.get("article a").first().click({ force: true });
  });
});
