class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create#投稿データの保存
    @book = Book.new(book_params)
    @book.user_id = current_user.id#bookモデルに紐づいたuser_idを操作+ログイン中のユーザー情報を取得
    @book.save                  #book(投稿データ)のuser_idを投稿データに今ログイン中のユーザーIDを持たせる
    redirect_to book_path(current_user)#bookのshowページへのリンク
    #if @book.save
    #flash[:notice] = "You have created book successfully."
    #redirect_to show_path#(@book)
    #else
    #@book = Book.all.order(created_at: :desc)
    #@book = Book.find_by(params[:id])
    #@books = Book.all
    #render "show_path"
  
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
     @book = Book.new
     @books = Book.find(params[:id])
     @user = @books.user
     #@user = User.book(user.id)
     #@book = Book.find(book.id)
     #@books = @user.book.page(params[:page])
     #@book = @user.book(book_params[:id])
     
  end
  
  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(current_user.id)
  # end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
