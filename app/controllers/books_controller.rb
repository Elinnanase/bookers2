class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book)
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id]) # 削除するPostImageレコードを取得
    book.destroy # レコードを削除
    redirect_to books_path # PostImageの一覧ページへのパス
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated the book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
