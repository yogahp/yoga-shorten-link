# frozen_string_literal: true

class ShortenLinksController < ApplicationController
  before_action :set_shorten_link, only: [:show, :edit, :update, :destroy]

  # GET /shorten_links
  # GET /shorten_links.json
  def index
    @shorten_links = ShortenLink.all
  end

  # GET /shorten_links/1
  # GET /shorten_links/1.json
  def show
  end

  # GET /shorten_links/new
  def new
    @shorten_link = ShortenLink.new
  end

  # GET /shorten_links/1/edit
  def edit
  end

  # POST /shorten_links
  # POST /shorten_links.json
  def create
    @shorten_link = ShortenLink.new(shorten_link_params)

    respond_to do |format|
      if @shorten_link.save
        format.html { redirect_to @shorten_link, notice: "Shorten link was successfully created." }
        format.json { render :show, status: :created, location: @shorten_link }
      else
        format.html { render :new }
        format.json { render json: @shorten_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shorten_links/1
  # PATCH/PUT /shorten_links/1.json
  def update
    respond_to do |format|
      if @shorten_link.update(shorten_link_params)
        format.html { redirect_to @shorten_link, notice: "Shorten link was successfully updated." }
        format.json { render :show, status: :ok, location: @shorten_link }
      else
        format.html { render :edit }
        format.json { render json: @shorten_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorten_links/1
  # DELETE /shorten_links/1.json
  def destroy
    @shorten_link.destroy
    respond_to do |format|
      format.html { redirect_to shorten_links_url, notice: "Shorten link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorten_link
      @shorten_link = ShortenLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorten_link_params
      params.require(:shorten_link).permit(:url, :slug, :custom)
    end
end
