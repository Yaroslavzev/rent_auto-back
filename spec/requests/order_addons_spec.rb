require 'rails_helper'

RSpec.describe "OrderAddons", type: :request do
  describe "GET /order_addons" do
    it "works! (now write some real specs)" do
      get order_addons_path
      expect(response).to have_http_status(200)
    end
  end
end
