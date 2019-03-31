require "rails_helper"

RSpec.describe PayTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pay_types").to route_to("pay_types#index")
    end

    it "routes to #show" do
      expect(:get => "/pay_types/1").to route_to("pay_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pay_types").to route_to("pay_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pay_types/1").to route_to("pay_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pay_types/1").to route_to("pay_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pay_types/1").to route_to("pay_types#destroy", :id => "1")
    end
  end
end
