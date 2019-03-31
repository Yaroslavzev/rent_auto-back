require "rails_helper"

RSpec.describe ManufacturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/manufactures").to route_to("manufactures#index")
    end

    it "routes to #show" do
      expect(:get => "/manufactures/1").to route_to("manufactures#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manufactures").to route_to("manufactures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manufactures/1").to route_to("manufactures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manufactures/1").to route_to("manufactures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manufactures/1").to route_to("manufactures#destroy", :id => "1")
    end
  end
end
