class Idea < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true
  belongs_to :category
end