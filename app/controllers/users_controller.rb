class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    #@book = @user.book
    #page#(params[:page])
  
  end
  
  def index
    
  end
  
  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction)
    
  end
  
end
