# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShortenLinksController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/shorten_links/new").to route_to("shorten_links#new")
    end

    it "routes to #show" do
      expect(get: "/shorten_links/1").to route_to("shorten_links#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/shorten_links").to route_to("shorten_links#create")
    end
  end
end
