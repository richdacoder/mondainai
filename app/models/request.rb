class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :messages
  validates :status, presence: true
  validates :user, uniqueness: { scope: :item, message: "You have already requested this item." }
  enum status: { Pending: 0, Accepted: 1, Rejected: 2, Inquiry: 3 }
end
