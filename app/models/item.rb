class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  enum status: { draft: 0, live: 1, claimed: 3 }
  validates :weight, numericality: { only_integer: true }
  validates :location, presence: true
end
