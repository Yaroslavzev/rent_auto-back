require "rails_helper"

RSpec.describe DaysRangesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/days_ranges").to route_to("days_ranges#index")
    end

    it "routes to #show" do
      expect(:get => "/days_ranges/1").to route_to("days_ranges#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/days_ranges").to route_to("days_ranges#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/days_ranges/1").to route_to("days_ranges#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/days_ranges/1").to route_to("days_ranges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/days_ranges/1").to route_to("days_ranges#destroy", :id => "1")
    end
  end
end
