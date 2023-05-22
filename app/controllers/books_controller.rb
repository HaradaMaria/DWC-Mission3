class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @users = User(params[:id])
  end


  def show
    @show = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Create successfully!!"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end


  def edit
    @edit = Book.find(params[:id])

  end


  def update
    @edit = Book.find(params[:id])
    if @edit.update(book_params)
      flash[:notice] = "Update successfully!!"
      redirect_to book_path(@edit.id)
    else
      
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Delete successfully!!"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:opinion)
  end

end
