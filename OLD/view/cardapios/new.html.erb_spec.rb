require 'rails_helper'

RSpec.describe "cardapios/new", :type => :view do
  before(:each) do
    assign(:cardapio, Cardapio.new())
  end

  it "renders new cardapio form" do
    render

    assert_select "form[action=?][method=?]", cardapios_path, "post" do
    end
  end
end
