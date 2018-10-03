class Card < ApplicationRecord
  belongs_to :list, -> { order(position: :asc) }

  validates :name, presence: true
end
