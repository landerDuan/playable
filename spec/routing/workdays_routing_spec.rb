require "spec_helper"

describe WorkdaysController do
  describe "routing" do

    it "routes to #index" do
      get("/workdays").should route_to("workdays#index")
    end

    it "routes to #new" do
      get("/workdays/new").should route_to("workdays#new")
    end

    it "routes to #show" do
      get("/workdays/1").should route_to("workdays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/workdays/1/edit").should route_to("workdays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/workdays").should route_to("workdays#create")
    end

    it "routes to #update" do
      put("/workdays/1").should route_to("workdays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/workdays/1").should route_to("workdays#destroy", :id => "1")
    end

  end
end
