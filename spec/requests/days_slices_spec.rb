require 'rails_helper'

RSpec.describe "DaysSlices", type: :request do
  describe "GET /days_slices" do
    it "works! (now write some real specs)" do
      get days_slices_path
      expect(response).to have_http_status(200)
    end
  end
end
