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
      render json: { message: "URLを入力してください" }, status: 400
    end
  end

  def show
    return_original_url = Url.find_by(short_url: params[:unmatched_route])
    if return_original_url.present?
      render json: return_original_url
    else
      render json: { message: "登録されていない短縮URLです" }, status: 400
    end
  end

  private

  def url_params
    params.permit(:original_url)
  end
end
