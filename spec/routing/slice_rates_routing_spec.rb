require "rails_helper"

RSpec.describe SliceRatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/slice_rates").to route_to("slice_rates#index")
    end

    it "routes to #show" do
      expect(:get => "/slice_rates/1").to route_to("slice_rates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/slice_rates").to route_to("slice_rates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/slice_rates/1").to route_to("slice_rates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/slice_rates/1").to route_to("slice_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/slice_rates/1").to route_to("slice_rates#destroy", :id => "1")
    end
  end
end
