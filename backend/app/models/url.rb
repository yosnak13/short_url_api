class Url < ApplicationRecord
  validates :short_url, presence: true, length: { maximum: 80 }
  validates :original_url, presence: true
end
