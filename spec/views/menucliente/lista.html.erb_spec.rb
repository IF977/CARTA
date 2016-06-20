require 'rails_helper'

RSpec.describe "menucliente/lista", :type => :view do

  context "Tela Lista" do
    it "Exibe tela lista de compra?" do
      render
    end
  end
  
  context "Tela lista testes de link." do
    it "Link finaliza pedido ok?" do
      visit '/menucliente/1/lista'
      click_link("Finalizar Pedido")
      expect(page).to be_truthy
    end
    it "Link voltar ok?" do
      visit '/menucliente/1/lista'
      click_link("Voltar ao Cardapio")
      expect(page).to be_truthy
    end
    it "Link limpar lista ok?" do
      visit '/menucliente/1/lista'
      click_link("Limpar Lista")
      expect(page).to be_truthy
    end
  end
end
