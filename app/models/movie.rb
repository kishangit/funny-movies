class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :src, presence: true
end
