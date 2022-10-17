# frozen_string_literal: true

class Review < ApplicationRecord
  enum status: { pended: 0, published: 1 }
  validates :body, presence: true, length: { maximum: 250 }
  validates :author_name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :author_email, presence: true, length: { maximum: 20 }, format: { with: VALID_EMAIL_REGEX }
  paginates_per 3
end
