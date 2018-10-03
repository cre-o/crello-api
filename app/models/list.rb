class List < ApplicationRecord
  has_many :cards, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :board

  validates :name, presence: true
end
