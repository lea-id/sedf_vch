require "spec_helper"

describe InternalsController do
  describe "routing" do

    it "routes to #index" do
      get("/internals").should route_to("internals#index")
    end

    it "routes to #new" do
      get("/internals/new").should route_to("internals#new")
    end

    it "routes to #show" do
      get("/internals/1").should route_to("internals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/internals/1/edit").should route_to("internals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/internals").should route_to("internals#create")
    end

    it "routes to #update" do
      put("/internals/1").should route_to("internals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/internals/1").should route_to("internals#destroy", :id => "1")
    end

  end
end
