require 'rails_helper'

RSpec.describe "BodyTypes", type: :request do
  describe "GET /body_types" do
    it "works! (now write some real specs)" do
      get body_types_path
      expect(response).to have_http_status(200)
    end
  end
end
