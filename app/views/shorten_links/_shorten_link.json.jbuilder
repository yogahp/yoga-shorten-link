# frozen_string_literal: true

json.extract! shorten_link, :id, :url, :slug, :custom, :deleted_at, :created_at, :updated_at
json.url shorten_link_url(shorten_link, format: :json)
