class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
    url = Url.new(url_params)
    url.create_short_url(url)
    if url.save
      render json: url
    else
      render json: url.errors, status: 422
    end
  end

  private

  def url_params
    params.permit(:original_url)
  end
end
