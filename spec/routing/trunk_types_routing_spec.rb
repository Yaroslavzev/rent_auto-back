require "rails_helper"

RSpec.describe TrunkTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/trunk_types").to route_to("trunk_types#index")
    end

    it "routes to #show" do
      expect(:get => "/trunk_types/1").to route_to("trunk_types#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trunk_types").to route_to("trunk_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/trunk_types/1").to route_to("trunk_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/trunk_types/1").to route_to("trunk_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trunk_types/1").to route_to("trunk_types#destroy", :id => "1")
    end
  end
end
