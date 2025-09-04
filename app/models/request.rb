class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :messages
  validates :status, presence: true
  validates :user, uniqueness: { scope: :item, message: "You have already requested this item." }
  enum status: { pending: 0, accepted: 1, rejected: 2, inquiry: 3 }
  # after_save :notify_pickup#, if: :pickup_date_changed?

  def notify_pickup
    if pickup_date
      messages.create(
        content: "Pickup date has been set for #{pickup_date}",
        user: user
      )
    end
  end
end
