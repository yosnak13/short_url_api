FactoryBot.define do
  factory :url do
  end

  factory :test_url, class: "url" do
    original_url { "http://example.is.too.long.url.to.remember.com" }
    short_url { "http://example.com" }
  end

  factory :character_test_url, class: "url" do
    original_url { "http://example.com/111111111111111111111111111111111111111100000000000000000000000000" }
    short_url { "http://example.com/111111111111111111111111111111111111111100000000000000000000000000" }
  end
end
