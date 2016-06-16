require 'rails_helper'

RSpec.describe "Cardapios", :type => :request do
  describe "GET /cardapios" do
    it "works! (now write some real specs)" do
      get cardapios_path
      expect(response.status).to be(200)
    end
  end
end
