class UsersController < ApplicationController
  def index
    @book = Book.new  
    @user = User.find(params[:id])
  end
  
  def show
  end

  def edit
  end
end
