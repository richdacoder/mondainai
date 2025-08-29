class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :requests
  validates :name, presence: true
  validates :description, presence: true
  enum status: { draft: 0, live: 1, pending: 2, claimed: 3 }


  include PgSearch::Model
    pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
    tsearch: { prefix: true }
  }
end
