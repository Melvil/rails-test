require "spec_helper"

describe AbilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/abilities").should route_to("abilities#index")
    end

    it "routes to #new" do
      get("/abilities/new").should route_to("abilities#new")
    end

    it "routes to #show" do
      get("/abilities/1").should route_to("abilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/abilities/1/edit").should route_to("abilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/abilities").should route_to("abilities#create")
    end

    it "routes to #update" do
      put("/abilities/1").should route_to("abilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/abilities/1").should route_to("abilities#destroy", :id => "1")
    end

  end
end
