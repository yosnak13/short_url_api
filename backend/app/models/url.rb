class Url < ApplicationRecord
  with_options presence: true do
    validates :original_url
    validates :short_url, length: { in: 1..80 }
  end

  def create_short_url(url)
    short_string = "http://" + SecureRandom.alphanumeric(5).to_s
    url.update(short_url: short_string)
  end
end
