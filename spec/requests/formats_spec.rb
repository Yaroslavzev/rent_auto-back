require 'rails_helper'

RSpec.describe "Formats", type: :request do
  describe "GET /formats" do
    it "works! (now write some real specs)" do
      get formats_path
      expect(response).to have_http_status(200)
    end
  end
end
