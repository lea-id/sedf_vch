require "spec_helper"

describe OutgoingsController do
  describe "routing" do

    it "routes to #index" do
      get("/outgoings").should route_to("outgoings#index")
    end

    it "routes to #new" do
      get("/outgoings/new").should route_to("outgoings#new")
    end

    it "routes to #show" do
      get("/outgoings/1").should route_to("outgoings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/outgoings/1/edit").should route_to("outgoings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/outgoings").should route_to("outgoings#create")
    end

    it "routes to #update" do
      put("/outgoings/1").should route_to("outgoings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/outgoings/1").should route_to("outgoings#destroy", :id => "1")
    end

  end
end
