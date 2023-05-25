# frozen_string_literal: true

# Comment model
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :body, presence: true, length: { minimum: 1, maximum: 300 }
end
