# frozen_string_literal: true

include ActionView::Helpers::OutputSafetyHelper

class ShortenLinksController < ApplicationController
  before_action -> { flash.now[:notice] = flash[:notice].html_safe if flash[:html_safe] && flash[:notice] }

  # GET /shorten_links/new
  def new
    @shorten_link = ShortenLink.new
  end

  # POST /shorten_links
  # POST /shorten_links.json
  def create
    @shorten_link = ShortenLink.new(shorten_link_params)

    respond_to do |format|
      if @shorten_link.save
        url_link = self.class.helpers.link_to(raw("<span class='fa fa-external-link'></span>"), "#{request.url}/#{@shorten_link.slug}", target: "_blank")
        format.html { redirect_to(new_shorten_link_path, notice: "Shorten link was successfully created. Your shorten url is #{request.url}/#{@shorten_link.slug} #{url_link}", flash: { html_safe: true }) }
      else
        format.html { render :new }
        format.json { render json: @shorten_link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def shorten_link_params
      params.require(:shorten_link).permit(:url, :custom)
    end
end
