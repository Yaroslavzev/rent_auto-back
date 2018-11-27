require 'rails_helper'

RSpec.describe "Calcs", type: :request do
  describe "GET /calcs" do
    it "works! (now write some real specs)" do
      get calcs_path
      expect(response).to have_http_status(200)
    end
  end
end
