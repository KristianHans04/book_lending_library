require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { title: "New Book", author: "Author", genre: "Genre" } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    book = books(:one)
    get book_url(book)
    assert_response :success
  end

  test "should get edit" do
    book = books(:one)
    get edit_book_url(book)
    assert_response :success
  end

  test "should update book" do
    book = books(:one)
    patch book_url(book), params: { book: { title: "Updated Title", author: "Author", genre: "Genre" } }
    assert_redirected_to book_url(book)
  end

  test "should destroy book" do
    book = books(:one)
    assert_difference('Book.count', -1) do
      delete book_url(book)
    end

    assert_redirected_to books_url
  end
end