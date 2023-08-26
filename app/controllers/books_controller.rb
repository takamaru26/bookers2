class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have creatad book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    # if @user == current_user
    #     render "edit"
    # else
    #   redirect_to user_path(current_user)
    # end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to  book_path(@book.id)
    else
      @books = Book.all
      flash[:notice] = 'errors prohibited this obj from being saved:'
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end