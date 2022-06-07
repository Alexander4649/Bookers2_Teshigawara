class UsersController < ApplicationController
  before_action :user_check,only:[:edit,:update]
  
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
    
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
    else
    render "edit"
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
  def user_check
    @user = User.find(params[:id])#@userにユーザー登録情報を代入
    if @user != current_user#登録ユーザー情報とログイン中のユーザーが違う時
      redirect_to user_path(current_user)#ログイン中のユーザーのマイページに遷移する
    end
  end
  
end
