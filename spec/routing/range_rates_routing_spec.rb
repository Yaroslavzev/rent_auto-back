require "rails_helper"

RSpec.describe RangeRatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/range_rates").to route_to("range_rates#index")
    end

    it "routes to #show" do
      expect(:get => "/range_rates/1").to route_to("range_rates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/range_rates").to route_to("range_rates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/range_rates/1").to route_to("range_rates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/range_rates/1").to route_to("range_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/range_rates/1").to route_to("range_rates#destroy", :id => "1")
    end
  end
end
