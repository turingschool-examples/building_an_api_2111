class Book < ApplicationRecord
  has_many :store_books
  has_many :stores, through: :store_books
end
