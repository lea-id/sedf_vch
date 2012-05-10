require "spec_helper"

describe IncomingsController do
  describe "routing" do

    it "routes to #index" do
      get("/incomings").should route_to("incomings#index")
    end

    it "routes to #new" do
      get("/incomings/new").should route_to("incomings#new")
    end

    it "routes to #show" do
      get("/incomings/1").should route_to("incomings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/incomings/1/edit").should route_to("incomings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/incomings").should route_to("incomings#create")
    end

    it "routes to #update" do
      put("/incomings/1").should route_to("incomings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/incomings/1").should route_to("incomings#destroy", :id => "1")
    end

  end
end
