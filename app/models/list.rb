class List < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }

  has_many :cards, dependent: :destroy
  belongs_to :user
end
