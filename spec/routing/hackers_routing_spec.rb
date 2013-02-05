require "spec_helper"

describe HackersController do
  describe "routing" do

    it "routes to #index" do
      get("/hackers").should route_to("hackers#index")
    end

    it "routes to #new" do
      get("/hackers/new").should route_to("hackers#new")
    end

    it "routes to #show" do
      get("/hackers/1").should route_to("hackers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hackers/1/edit").should route_to("hackers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hackers").should route_to("hackers#create")
    end

    it "routes to #update" do
      put("/hackers/1").should route_to("hackers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hackers/1").should route_to("hackers#destroy", :id => "1")
    end

  end
end
