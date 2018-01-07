# frozen_string_literal: true

require "rails_helper"

RSpec.describe "shorten_links/new", type: :view do
  before(:each) do
    assign(:shorten_link, ShortenLink.new(
                            url: "MyString",
                            slug: "MyString",
                            custom: false
    ))
  end

  it "renders new shorten_link form" do
    render

    assert_select "form[action=?][method=?]", shorten_links_path, "post" do

      assert_select "input[name=?]", "shorten_link[url]"

      assert_select "input[name=?]", "shorten_link[custom]"
    end
  end
end
