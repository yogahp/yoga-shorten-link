# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ShortenLinks", type: :request do
  describe "GET /shorten_links" do
    it "works! (now write some real specs)" do
      get shorten_links_path
      expect(response).to have_http_status(200)
    end
  end
end
