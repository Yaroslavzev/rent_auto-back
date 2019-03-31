require "rails_helper"

RSpec.describe FormatsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/formats").to route_to("formats#index")
    end

    it "routes to #show" do
      expect(:get => "/formats/1").to route_to("formats#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/formats").to route_to("formats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/formats/1").to route_to("formats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/formats/1").to route_to("formats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/formats/1").to route_to("formats#destroy", :id => "1")
    end
  end
end
