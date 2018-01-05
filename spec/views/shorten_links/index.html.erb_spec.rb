# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shorten_links/index", type: :view do
  before(:each) do
    assign(:shorten_links, [
      ShortenLink.create!(
        url: "Url",
        slug: "Slug",
        custom: false
      ),
      ShortenLink.create!(
        url: "Url",
        slug: "Slug",
        custom: false
      )
    ])
  end

  it "renders a list of shorten_links" do
    render
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: "Slug".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
