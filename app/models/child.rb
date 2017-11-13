class Child < ApplicationRecord
  belongs_to :user
  has_many :games

  validates :name,
  presence: true,
  on: :create
end
