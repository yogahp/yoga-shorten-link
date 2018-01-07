# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @shorten_link = ShortenLink.new
  end
end
