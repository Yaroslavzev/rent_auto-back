require "rails_helper"

RSpec.describe DaysSlicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/days_slices").to route_to("days_slices#index")
    end

    it "routes to #show" do
      expect(:get => "/days_slices/1").to route_to("days_slices#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/days_slices").to route_to("days_slices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/days_slices/1").to route_to("days_slices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/days_slices/1").to route_to("days_slices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/days_slices/1").to route_to("days_slices#destroy", :id => "1")
    end
  end
end
