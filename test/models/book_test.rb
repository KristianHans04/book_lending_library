require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Author", genre: "Genre")
    assert_not book.save
  end

  test "should not save book without author" do
    book = Book.new(title: "Title", genre: "Genre")
    assert_not book.save
  end
end