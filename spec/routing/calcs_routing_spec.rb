require "rails_helper"

RSpec.describe CalcsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/calcs").to route_to("calcs#index")
    end

    it "routes to #show" do
      expect(:get => "/calcs/1").to route_to("calcs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/calcs").to route_to("calcs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/calcs/1").to route_to("calcs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/calcs/1").to route_to("calcs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/calcs/1").to route_to("calcs#destroy", :id => "1")
    end
  end
end
