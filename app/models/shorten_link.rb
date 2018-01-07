# frozen_string_literal: true

# == Schema Information
#
# Table name: shorten_links
#
#  id         :integer          not null, primary key
#  url        :string
#  slug       :string
#  custom     :boolean          default(FALSE)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class ShortenLink < ApplicationRecord
  acts_as_paranoid

  validates :url, presence: true
  validates :url, url: true

  after_create :generate_slug

  private

    def generate_slug
      self.slug = self.id.to_s(36)
      self.save
    end
end
