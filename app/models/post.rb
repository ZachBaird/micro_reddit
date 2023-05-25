# frozen_string_literal: true

# Post model
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true, length: { minimum: 1 }
end
