require 'rails_helper'

RSpec.describe "RangeRates", type: :request do
  describe "GET /range_rates" do
    it "works! (now write some real specs)" do
      get range_rates_path
      expect(response).to have_http_status(200)
    end
  end
end
