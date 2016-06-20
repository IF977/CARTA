require 'rails_helper'

RSpec.describe "menucliente/1/show", :type => :view do

  context "Tela Show" do
    it "Exibe tela produto?" do
      render
    end
  end
  
  context "Tela produto testes de link." do
    it "Link voltar ok?" do
      visit '/menucliente/1/show'
      click_link("Voltar ao Cardapio")
      expect(page).to be_truthy
    end
    it "Link add a lista ok?" do
      visit '/menucliente/1/show'
      click_link("Add a Lista")
      expect(page).to be_truthy
    end
  end
end
