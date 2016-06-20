require 'rails_helper'

RSpec.describe "menucliente/conta", :type => :view do

  context "Tela conta" do
    it "Exibe tela de conta?" do
      render
    end
  end
  
  context "Tela cardapio testes de link" do
    it "Link fecha conta ok?" do
      visit '/menucliente/conta'
      click_link("")
      expect(page).to be_truthy
    end
    it "Link voltar ok?" do
      visit '/menucliente/conta'
      click_link("Voltar")
      expect(page).to be_truthy
    end
  end
end
