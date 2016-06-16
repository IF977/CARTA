require 'rails_helper'

RSpec.describe "menucliente/home", :type => :view do

    context "Tela inicial" do
        it "Exibe tela inicial?" do
            render
        end
  
        it "Link de tela ok?" do
            visit '/menucliente/home'
            click_link("")
            expect(page).to be_truthy
        end
    end    
end
