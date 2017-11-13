class Game < ApplicationRecord
  belongs_to :user
  belongs_to :child

  validates :level,
  presence: true,
  on: :create

  validates :operation,
  presence: true,
  on: :create

end
