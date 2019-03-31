require "rails_helper"

RSpec.describe OrderAddonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/order_addons").to route_to("order_addons#index")
    end

    it "routes to #show" do
      expect(:get => "/order_addons/1").to route_to("order_addons#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/order_addons").to route_to("order_addons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/order_addons/1").to route_to("order_addons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/order_addons/1").to route_to("order_addons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_addons/1").to route_to("order_addons#destroy", :id => "1")
    end
  end
end
