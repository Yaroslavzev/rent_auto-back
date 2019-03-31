require 'rails_helper'

RSpec.describe "Manufactures", type: :request do
  describe "GET /manufactures" do
    it "works! (now write some real specs)" do
      get manufactures_path
      expect(response).to have_http_status(200)
    end
  end
end
