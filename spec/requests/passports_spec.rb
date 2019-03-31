require 'rails_helper'

RSpec.describe "Passports", type: :request do
  describe "GET /passports" do
    it "works! (now write some real specs)" do
      get passports_path
      expect(response).to have_http_status(200)
    end
  end
end
