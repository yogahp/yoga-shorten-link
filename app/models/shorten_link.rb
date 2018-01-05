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
end
