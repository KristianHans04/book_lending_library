require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  test "should create a borrowing" do
    book = books(:one)

    assert_difference("Borrowing.count", 1) do
      post borrowings_create_url(book_id: book.id), params: { borrowing: { borrower_name: "Alice", borrow_date: Date.today } }
    end

    assert_redirected_to book_url(book)
    assert_equal "Book was successfully borrowed.", flash[:notice]
  end

  test "should not create a borrowing for an already borrowed book" do
    book = books(:two)
    book.borrowings.create!(borrower_name: "Bob", borrow_date: Date.today)

    assert_no_difference("Borrowing.count") do
      post borrowings_create_url(book_id: book.id), params: { borrowing: { borrower_name: "Alice", borrow_date: Date.today } }
    end

    assert_redirected_to book_url(book)
    assert_equal "This book is already borrowed.", flash[:alert]
  end

  test "should return a borrowed book" do
    book = books(:two)
    borrowing = book.borrowings.create!(borrower_name: "Bob", borrow_date: Date.today)

    post borrowings_return_url(book_id: book.id)

    assert_redirected_to book_url(book)
    assert_equal "Book was successfully returned.", flash[:notice]
    assert borrowing.reload.return_date.present?
  end

  test "should handle returning a book that is not borrowed" do
    book = books(:one)

    post borrowings_return_url(book_id: book.id)

    assert_redirected_to book_url(book)
    assert_equal "Failed to return book.", flash[:alert]
  end
end
