class UrlsController < ApplicationController
  def index
    render json: Url.all
  end

  def create
    url = Url.new(url_params)
    if url.save
      render json: url
    else
      render json:url.errors, status: 422
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url, :short_url)
  end
end
