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
        existing_shorten_link = ShortenLink.find_by(url: shorten_link_params[:url])

        if existing_shorten_link.present?
          url_link = self.class.helpers.link_to(raw("<span class='fa fa-external-link'></span>"), "#{request.url}/#{existing_shorten_link.slug}", target: "_blank")
          flash.now[:notice] = "Shorten link was existed. Your shorten url is #{request.url}/#{existing_shorten_link.slug} #{url_link}".html_safe
        end

        format.html { render :new }
        format.json { render json: @shorten_link.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    shorten_link = ShortenLink.find_by(slug: params[:id])

    if shorten_link.blank?
      redirect_to new_shorten_link_path, flash: { alert: "Shorten Link not found" }
    else
      if shorten_link.url =~ URI::regexp
        uri = URI.parse(shorten_link.url)
        redirect_to uri.to_s
      else
        redirect_to new_shorten_link_path, flash: { alert: "URL is not a valid URI" }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def shorten_link_params
      params.require(:shorten_link).permit(:url, :custom, :slug)
    end
end
