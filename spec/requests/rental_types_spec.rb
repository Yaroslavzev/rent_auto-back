require 'rails_helper'

RSpec.describe "RentalTypes", type: :request do
  describe "GET /rental_types" do
    it "works! (now write some real specs)" do
      get rental_types_path
      expect(response).to have_http_status(200)
    end
  end
end
