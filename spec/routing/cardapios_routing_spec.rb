require "rails_helper"

RSpec.describe CardapiosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cardapios").to route_to("cardapios#index")
    end

    it "routes to #new" do
      expect(:get => "/cardapios/new").to route_to("cardapios#new")
    end

    it "routes to #show" do
      expect(:get => "/cardapios/1").to route_to("cardapios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cardapios/1/edit").to route_to("cardapios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cardapios").to route_to("cardapios#create")
    end

    it "routes to #update" do
      expect(:put => "/cardapios/1").to route_to("cardapios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cardapios/1").to route_to("cardapios#destroy", :id => "1")
    end

  end
end
