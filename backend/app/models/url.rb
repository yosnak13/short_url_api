class Url < ApplicationRecord
  require 'securerandom'

  with_options presence: true do
    validates :original_url
    validates :short_url, length: { in: 1..80 }
  end

  def create_short_url
    short = SecureRandom.alphanumeric(5)
    
  end
end
