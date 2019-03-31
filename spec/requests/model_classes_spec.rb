require 'rails_helper'

RSpec.describe "ModelClasses", type: :request do
  describe "GET /model_classes" do
    it "works! (now write some real specs)" do
      get model_classes_path
      expect(response).to have_http_status(200)
    end
  end
end
