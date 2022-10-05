class Review < ApplicationRecord
  enum status: { pended: 0, published: 1 }
  validates :body, presence: true, length: { maximum: 250 }
  scope :approved, -> {where(acceptance: true)}
end
