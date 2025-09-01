class Message < ApplicationRecord
  belongs_to :user
  belongs_to :request
  validates :content, presence: true
  after_create_commit :broadcast_append_to_request

  private

  def broadcast_append_to_request
    broadcast_append_to request, target: "messages", partial: "messages/message", locals: { message: self }
  end
end
