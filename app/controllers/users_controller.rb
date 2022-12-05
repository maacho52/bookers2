class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  end


  def update
    @user = User.find(params[:id])
   if @user.save
     flash[:notice] = "You have updated user successfully."
     redirect_to book_path(@user)
   else
     render :edit
   end
  end

  private


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
