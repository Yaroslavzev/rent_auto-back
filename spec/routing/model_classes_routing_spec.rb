require "rails_helper"

RSpec.describe ModelClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/model_classes").to route_to("model_classes#index")
    end

    it "routes to #show" do
      expect(:get => "/model_classes/1").to route_to("model_classes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/model_classes").to route_to("model_classes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/model_classes/1").to route_to("model_classes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/model_classes/1").to route_to("model_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/model_classes/1").to route_to("model_classes#destroy", :id => "1")
    end
  end
end
