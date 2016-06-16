require 'rails_helper'

RSpec.describe "cardapios/show", :type => :view do
  before(:each) do
    @cardapio = assign(:cardapio, Cardapio.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
