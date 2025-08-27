class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :requests
  has_many :items
  has_many :requests_as_owner, through: :items, source: :requests
  has_many :messages
  validates :name, presence: true
end
