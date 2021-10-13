class BooksController < ApplicationController
  protect_from_forgery

  def index
    @books = Book.all
    @book = Book.new
  end


  def show
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def destroy
      @book = Book.find(params[:id])
   if @book.destroy
      redirect_to books_path
   end
  end

  def create
       @book = Book.new(book_params)
    if @book.save(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render action: :index
    end
  end

  def update
     @book = Book.find(params[:id])
  if @book.update(book_params)
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book)
  else
     render :edit
  end
  end

  private
  # ストロングパラメータ
  def book_params
   params.require(:book).permit(:title, :body)
  end
end