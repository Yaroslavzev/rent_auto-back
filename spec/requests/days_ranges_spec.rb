require 'rails_helper'

RSpec.describe "DaysRanges", type: :request do
  describe "GET /days_ranges" do
    it "works! (now write some real specs)" do
      get days_ranges_path
      expect(response).to have_http_status(200)
    end
  end
end
