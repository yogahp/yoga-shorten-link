# frozen_string_literal: true

class CreateShortenLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :shorten_links do |t|
      t.string :url
      t.string :slug
      t.boolean :custom
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :shorten_links, :deleted_at
  end
end
