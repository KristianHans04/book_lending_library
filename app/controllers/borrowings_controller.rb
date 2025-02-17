class BorrowingsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    if @book.borrowings.where(return_date: nil).exists?
      redirect_to @book, alert: 'This book is already borrowed.'
    else
      @borrowing = @book.borrowings.build(borrowing_params)
      if @borrowing.save
        redirect_to @book, notice: 'Book was successfully borrowed.'
      else
        redirect_to @book, alert: 'Failed to borrow book.'
      end
    end
  end

  def return
    @book = Book.find(params[:book_id])
    @borrowing = @book.borrowings.where(return_date: nil).first
    if @borrowing&.update(return_date: Date.today)
      redirect_to @book, notice: 'Book was successfully returned.'
    else
      redirect_to @book, alert: 'Failed to return book.'
    end
  end

  private

  def borrowing_params
    params.require(:borrowing).permit(:borrower_name, :borrow_date)
  end
end