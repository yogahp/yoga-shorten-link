# frozen_string_literal: true

json.array! @shorten_links, partial: "shorten_links/shorten_link", as: :shorten_link
