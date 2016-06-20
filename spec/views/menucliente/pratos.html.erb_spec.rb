require 'rails_helper'

RSpec.describe "menucliente/pratos", :type => :view do

  context "Tela pratos" do
    it "Exibe tela cardapio?" do
      render
    end
  end
  
  context "Tela cardapio testes de link." do
    it "Link produto ok?" do
      visit '/menucliente/pratos'
      click_link("Imagem003")
      expect(page).to be_truthy
    end
    it "Link voltar ok?" do
      visit '/menucliente/pratos'
      click_link("Voltar")
      expect(page).to be_truthy
    end
    it "Link  ok?" do
      visit '/menucliente/pratos'
      click_link("Limpar Lista")
      expect(page).to be_truthy
    end
  end
end
