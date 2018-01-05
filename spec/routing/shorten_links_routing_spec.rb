# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShortenLinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/shorten_links").to route_to("shorten_links#index")
    end

    it "routes to #new" do
      expect(get: "/shorten_links/new").to route_to("shorten_links#new")
    end

    it "routes to #show" do
      expect(get: "/shorten_links/1").to route_to("shorten_links#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shorten_links/1/edit").to route_to("shorten_links#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/shorten_links").to route_to("shorten_links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shorten_links/1").to route_to("shorten_links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shorten_links/1").to route_to("shorten_links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shorten_links/1").to route_to("shorten_links#destroy", id: "1")
    end

  end
end
