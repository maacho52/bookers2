class BooksController < ApplicationController
before_action :correct_user, only: [:edit]

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def show
    @user = current_user
    @books = @user.books
  end

  def create
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
      flash[ :notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    end
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

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end


end