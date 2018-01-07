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

require "rails_helper"
require "uri"

describe ShortenLink, type: :model do
  context "db column" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:slug).of_type(:string) }
    it { should have_db_column(:custom).of_type(:boolean).with_options(default: false) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:deleted_at).of_type(:datetime) }
  end

  context "validation" do
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }

    let(:shorten_link) { create :shorten_link }

    it "validate url" do
      expect(valid_url?(shorten_link.url)).to eql(true)
    end

    it "validate slug" do
      shorten_link = ShortenLink.new(url: "http://www.google.com", slug: nil, custom: true)
      shorten_link.save
      expect(shorten_link.errors).to be_present
    end

    it "uniq slug" do
      existing_shorten_link = create :shorten_link
      shorten_link = ShortenLink.new(url: "http://www.google.com", slug: existing_shorten_link.slug, custom: true)
      shorten_link.save
      expect(shorten_link.errors).to be_present
    end
  end

  context "soft delete" do
    let(:shorten_link) { create :shorten_link }

    it do
      shorten_link.destroy
      expect(shorten_link.deleted_at).to be_present
    end
  end

  context "after create" do
    it do
      shorten_link = ShortenLink.new(url: "http://www.google.com")
      shorten_link.save
      expect(shorten_link.slug).to be_present
    end
  end
end

def valid_url?(uri)
  uri = URI.parse(uri)
  !uri.host.nil?
rescue URI::InvalidURIError
  false
end
