require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "/urlsへのリクエスト" do
    it "アクセスできること" do
      get urls_path
      expect(response).to have_http_status(200)
    end
  end

  describe "register-urlへのリクエスト" do
    context "入力値が正しいとき" do
      it "短縮URLが登録できること" do
        post register_url_path, params: {original_url: "http://localhost:3000-test"}
        expect(response).to have_http_status(200)
      end
    end

    context "入力値が誤っているとき" do
      it "短縮URLが登録できないこと" do
        post register_url_path, params: {original_url: ""}
        expect(response).to have_http_status(400)
      end
    end
  end
end
