require 'rails_helper'

RSpec.describe "cardapios/index", :type => :view do
  before(:each) do
    assign(:cardapios, [
      Cardapio.create!(),
      Cardapio.create!()
    ])
  end

  it "renders a list of cardapios" do
    render
  end
end
