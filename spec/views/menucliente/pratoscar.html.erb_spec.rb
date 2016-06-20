require 'rails_helper'

RSpec.describe "menucliente/pratoscar", :type => :view do

  context "Tela pratoscar" do
    it "Exibe tela cardapio?" do
      render
    end
  end
  
  context "Tela cardapio testes de link." do
    it "Link produto ok?" do
      visit '/menucliente/pratoscar'
      click_link("Imagem003")
      expect(page).to be_truthy
    end
    it "Link voltar ok?" do
      visit '/menucliente/pratoscar'
      click_link("Voltar")
      expect(page).to be_truthy
    end
    it "Link  ok?" do
      visit '/menucliente/pratoscar'
      click_link("Limpar Lista")
      expect(page).to be_truthy
    end
  end
end
