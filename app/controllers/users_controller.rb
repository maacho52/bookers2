class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
