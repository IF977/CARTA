require 'rails_helper'

RSpec.describe "menucliente/cardapio", :type => :view do

  context "Tela cardapio" do
    it "Exibe opções da aplicação?" do
      render
    end
  end
  
  context "Tela cardapio testes de link" do
    it "Link de tela ok?" do
      visit '/menucliente/cardapio'
      click_link("")
      expect(page).to be_truthy
    end
  end
end
