class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :messages
  validates :status, presence: true
  validates :user, uniqueness: { scope: :item, message: "You have already requested this item." }
  enum status: { pending: 0, accepted: 1, rejected: 2, inquiry: 3 }
end
