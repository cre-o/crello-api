class Board < ApplicationRecord
  has_many :lists, -> { order(position: :asc) }, dependent: :destroy
  has_many :cards, through: :lists

  scope :public_boards, -> { where(private: false) }
end
