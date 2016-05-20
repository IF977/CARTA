require 'rails_helper'

RSpec.describe "cardapios/edit", :type => :view do
  before(:each) do
    @cardapio = assign(:cardapio, Cardapio.create!())
  end

  it "renders the edit cardapio form" do
    render

    assert_select "form[action=?][method=?]", cardapio_path(@cardapio), "post" do
    end
  end
end
