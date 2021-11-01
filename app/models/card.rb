class Card < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :memo, length: { maximum: 1000 }

  belongs_to :list
end
