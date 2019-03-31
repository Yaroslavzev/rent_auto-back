require "rails_helper"

RSpec.describe TrunksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/trunks").to route_to("trunks#index")
    end

    it "routes to #show" do
      expect(:get => "/trunks/1").to route_to("trunks#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trunks").to route_to("trunks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/trunks/1").to route_to("trunks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/trunks/1").to route_to("trunks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trunks/1").to route_to("trunks#destroy", :id => "1")
    end
  end
end
