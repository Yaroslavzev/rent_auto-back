require 'rails_helper'

RSpec.describe "DriverLicenses", type: :request do
  describe "GET /driver_licenses" do
    it "works! (now write some real specs)" do
      get driver_licenses_path
      expect(response).to have_http_status(200)
    end
  end
end
