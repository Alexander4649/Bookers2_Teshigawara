class UsersController < ApplicationController
  
  
  def show
    @book = Book.new#新規投稿をする際に空のbookを@bookに代入する=>だから新規投稿をするよとなるコード
    @user = User.find(params[:id])#登録されたUserをuser_idでfindしてあげることで@userに代入してViweにて適用することができる
    @books = @user.books#userが投稿したbooks全てを@booksに代入するからマイページのshowページの投稿一覧表示される
  end
  
  def index
     @book = Book.new
     @user = User.find(current_user.id)#ログイン中のアカウントを見つける
     @users = User.all#allメソッドでデータベース内のデータ全て取得
  end
  
  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
    
  end
  
end
