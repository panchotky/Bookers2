class BooksController < ApplicationController

  def top
  end

  def about
  end

  def index
    # book情報一覧表示
      @books = Book.all
    # user写真一覧表示
      @user = User.all
    # my情報表示(おそらく違う)
      @info = current_user
    # 新規投稿表示
      @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book.id), notice: 'Book was successfully created'
      else
        @books = Book.all
        # user写真一覧表示
        @user = User.all
        # my情報表示(おそらく違う)
        @info = current_user
        render :index
      end
  end

  def edit
      @book = Book.find(params[:id])
      # ブックに紐づいたユーザーがカレントユーザーではなかったら、一覧へリダイレクト
      unless
      @book.user == current_user
      redirect_to books_path
      end
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
       redirect_to book_path(@book.id), notice: 'Book was successfully update'
      else
       render :edit
      end
  end

  def show
      # 選択されたbook情報
      @book = Book.find(params[:id])
      #bookに紐づいたユーザー情報
      @user = @book.user
      # 新規投稿表示
      @booknew = Book.new

  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

     private

     def book_params
         params.require(:book).permit(:title, :opinion)
     end


end
