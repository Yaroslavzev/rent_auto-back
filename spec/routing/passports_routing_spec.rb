require "rails_helper"

RSpec.describe PassportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/passports").to route_to("passports#index")
    end

    it "routes to #show" do
      expect(:get => "/passports/1").to route_to("passports#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/passports").to route_to("passports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/passports/1").to route_to("passports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/passports/1").to route_to("passports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/passports/1").to route_to("passports#destroy", :id => "1")
    end
  end
end
