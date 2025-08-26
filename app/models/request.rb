class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :messages
  validates :status, presence: true
end
