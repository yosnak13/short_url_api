class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
  end
end
