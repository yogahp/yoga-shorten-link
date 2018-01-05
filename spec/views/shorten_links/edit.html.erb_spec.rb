# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shorten_links/edit", type: :view do
  before(:each) do
    @shorten_link = assign(:shorten_link, ShortenLink.create!(
                                            url: "MyString",
                                            slug: "MyString",
                                            custom: false
    ))
  end

  it "renders the edit shorten_link form" do
    render

    assert_select "form[action=?][method=?]", shorten_link_path(@shorten_link), "post" do

      assert_select "input[name=?]", "shorten_link[url]"

      assert_select "input[name=?]", "shorten_link[slug]"

      assert_select "input[name=?]", "shorten_link[custom]"
    end
  end
end
