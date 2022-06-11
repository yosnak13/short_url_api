class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
    url = Url.new(url_params)
    short_string = SecureRandom.alphanumeric(5)
    url.update(short_url: short_string)
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
