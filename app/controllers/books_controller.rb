class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = User.find(params[:id])
  end

end
