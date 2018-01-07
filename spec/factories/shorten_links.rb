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

FactoryBot.define do
  factory :shorten_link do
    url "https://www.#{Faker::Name.first_name.downcase}.com"
    slug "MyString"
    custom false
  end
end
