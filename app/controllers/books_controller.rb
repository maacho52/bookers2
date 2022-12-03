class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'

  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

  end


end