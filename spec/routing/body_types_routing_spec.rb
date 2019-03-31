require "rails_helper"

RSpec.describe BodyTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/body_types").to route_to("body_types#index")
    end

    it "routes to #show" do
      expect(:get => "/body_types/1").to route_to("body_types#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/body_types").to route_to("body_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/body_types/1").to route_to("body_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/body_types/1").to route_to("body_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/body_types/1").to route_to("body_types#destroy", :id => "1")
    end
  end
end
