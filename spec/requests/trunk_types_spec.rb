require 'rails_helper'

RSpec.describe "TrunkTypes", type: :request do
  describe "GET /trunk_types" do
    it "works! (now write some real specs)" do
      get trunk_types_path
      expect(response).to have_http_status(200)
    end
  end
end
