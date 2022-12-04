class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
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
      render :show
    end
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