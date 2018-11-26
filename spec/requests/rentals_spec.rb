require 'rails_helper'

RSpec.describe "Rentals", type: :request do
  describe "GET /rentals" do
    it "works! (now write some real specs)" do
      get rentals_path
      expect(response).to have_http_status(200)
    end
  end
end
