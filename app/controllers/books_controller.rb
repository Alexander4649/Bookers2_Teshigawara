class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create#投稿データの保存
    @book = Book.new(book_params)
    @book.user_id = current_user.id#bookモデルに紐づいたuser_idを操作+ログイン中のユーザー情報を取得
    @book.save                     #book(投稿データ)のuser_idを投稿データに今ログイン中のユーザーIDを持たせる
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
  end

  def show
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
