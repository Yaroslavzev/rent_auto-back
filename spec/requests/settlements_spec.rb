require 'rails_helper'

RSpec.describe "Settlements", type: :request do
  describe "GET /settlements" do
    it "works! (now write some real specs)" do
      get settlements_path
      expect(response).to have_http_status(200)
    end
  end
end
