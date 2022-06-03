require 'rails_helper'

RSpec.describe Url, type: :model do
  describe "登録するURLが正しいとき" do
    it "登録するURLが1文字以上存在するとき" do
      new_short_url = build(:test_url)
      expect(new_short_url).to be_valid
      expect(new_short_url.save).to be_truthy
    end

    it "登録するURLが1文字も存在しないとき" do
      new_wrong_url = build(:test_url, original_url: "")
      expect(new_wrong_url).not_to be_valid
      expect(new_wrong_url.save).to be_falsey
    end
  end

  describe "短縮URLの文字数の試験" do
    it "80文字以下の短縮URLを認める" do
      new_short_url = build(:character_test_url, short_url: "http://localhost:3000/abc")
      expect(new_short_url).to be_valid
    end

    it "81文字以上の短縮URLを認めない" do
      too_long_short_url = build(:character_test_url)
      expect(too_long_short_url).not_to be_valid
    end
  end
end
