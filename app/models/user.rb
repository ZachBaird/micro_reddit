# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :username, presence: true, length: { minimum: 4, maximum: 12 }
  validates :name, length: { minimum: 2, maximum: 30 }
end
