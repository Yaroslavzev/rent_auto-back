require "rails_helper"

RSpec.describe DriverLicensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/driver_licenses").to route_to("driver_licenses#index")
    end

    it "routes to #show" do
      expect(:get => "/driver_licenses/1").to route_to("driver_licenses#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/driver_licenses").to route_to("driver_licenses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/driver_licenses/1").to route_to("driver_licenses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/driver_licenses/1").to route_to("driver_licenses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/driver_licenses/1").to route_to("driver_licenses#destroy", :id => "1")
    end
  end
end
