class CreateBorrowings < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowings do |t|
      t.references :book, null: false, foreign_key: true
      t.string :borrower_name
      t.date :borrow_date
      t.date :return_date

      t.timestamps
    end
  end
end
