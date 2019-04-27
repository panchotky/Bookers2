class UsersController < ApplicationController


  def create
      @user = User.new(user_params)
      @user.save
      redirect_to user_path(@user.id)
  end

  def show
      # 選択した人のユーザー情報
  	  @user = User.find(params[:id])
      # ユーザーに紐づけされた投稿情報
      @books = @user.books
      # 新規投稿表示
      @book = Book.new
  end

  def index
  	  @users = User.all
       # my情報表示(おそらく違う)
      @info = current_user
       # 新規投稿表示
      @book = Book.new
  end

  def edit
  	  @user = User.find(params[:id])
      @introduction = User.new
  end

  def update
  	  @user = User.find(params[:id])
      if @user.update(user_params)
  	    redirect_to user_path(@user.id), notice: ' You have updated user successfully '
      else
        @introduction = User.new
        render :edit
      end
  end

  private

    def user_params
        params.require(:user).permit(:name, :image, :introduction, :email)
    end

end

