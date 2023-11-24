class List < ApplicationRecord
  has_many_attached :photos
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, uniqueness: true, presence: true
end
