class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 10 }
  validates :description, presence: true

  belongs_to :user
  has_many :articles_categories
  has_many :categories, through: :articles_categories
end
