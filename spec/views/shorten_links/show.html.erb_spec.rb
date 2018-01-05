# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shorten_links/show", type: :view do
  before(:each) do
    @shorten_link = assign(:shorten_link, ShortenLink.create!(
                                            url: "Url",
                                            slug: "Slug",
                                            custom: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/false/)
  end
end
