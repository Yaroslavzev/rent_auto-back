require "rails_helper"

RSpec.describe RegionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/regions").to route_to("regions#index")
    end

    it "routes to #show" do
      expect(:get => "/regions/1").to route_to("regions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/regions").to route_to("regions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/regions/1").to route_to("regions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/regions/1").to route_to("regions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/regions/1").to route_to("regions#destroy", :id => "1")
    end
  end
end
