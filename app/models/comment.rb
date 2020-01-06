class Comment < ApplicationRecord
  belongs_to :post
  validates :message, length: {minimum: 5}
end
