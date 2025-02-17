class Book < ApplicationRecord
    has_many :borrowings, dependent: :destroy
    validates :title, presence: true
    validates :author, presence: true
  end