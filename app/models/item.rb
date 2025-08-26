class Item < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  enum status: { draft: 0, live: 1, pending: 2, claimed: 3 }
  validates :weight, numericality: { only_integer: true }
end
