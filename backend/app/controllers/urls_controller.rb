class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
    url = Url.new(url_params)
    short = SecureRandom.alphanumeric(5)
    url.update(short_url: "#{url.id}".to_s + short)
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
