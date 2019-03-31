require "rails_helper"

RSpec.describe RentalTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/rental_types").to route_to("rental_types#index")
    end

    it "routes to #show" do
      expect(:get => "/rental_types/1").to route_to("rental_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/rental_types").to route_to("rental_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rental_types/1").to route_to("rental_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rental_types/1").to route_to("rental_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rental_types/1").to route_to("rental_types#destroy", :id => "1")
    end
  end
end
