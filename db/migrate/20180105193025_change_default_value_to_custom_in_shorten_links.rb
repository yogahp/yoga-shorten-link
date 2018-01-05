# frozen_string_literal: true

class ChangeDefaultValueToCustomInShortenLinks < ActiveRecord::Migration[5.1]
  def change
    change_column :shorten_links, :custom, :boolean, default: false
  end
end
