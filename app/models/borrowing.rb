class Borrowing < ApplicationRecord
  belongs_to :book
  validates :borrower_name, presence: true
  validates :borrow_date, presence: true
end