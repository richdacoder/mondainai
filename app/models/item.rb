class Item < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :requests
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  enum status: { draft: 0, live: 1, pending: 2, claimed: 3 }


  include PgSearch::Model
    pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
    tsearch: { prefix: true }
  }

  def build_prompt
    prompt = <<-PROMPT
      This item is for a free item giveaway application similar to craigslist. It should take this image of a #{ name }, find the main #{ name } shown, and in 280 characters give a description of the #{ name } for someone who would want it. The description should give helpful details. If the model is not known, the description should not mention it.
    PROMPT
  end
end
