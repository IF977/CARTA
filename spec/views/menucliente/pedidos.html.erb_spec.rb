require 'rails_helper'

RSpec.describe "menucliente/pedidos", :type => :view do

  context "Tela Pedidos" do
    it "Exibe tela pedidos?" do
      render
    end
  end
  
  context "Tela lista testes de link." do
    it "Link finaliza pedido ok?" do
      visit '/menucliente/pedidos'
      click_link("Chamar Garçom")
      expect(page).to be_truthy
    end
    it "Link voltar ok?" do
      visit '/menucliente/pedidos'
      click_link("Voltar")
      expect(page).to be_truthy
    end
    it "Link limpar lista ok?" do
      visit '/menucliente/pedidos'
      click_link("Novo Pedido")
      expect(page).to be_truthy
    end
  end
end
