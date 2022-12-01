class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

end
