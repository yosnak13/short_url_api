class Url < ApplicationRecord
  with_options presence: true do
    validates :original_url
    validates :short_url, length: { in: 1..80 }
  end
end
