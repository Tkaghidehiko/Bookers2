class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
def show
  	@user = User.find(params[:id])
  	@book = Book.new
	@books = @user.books.all.order(created_at: :desc)
  end

def index
  @users = User.all.order(created_at: :desc)
  @book = Book.new
end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)

      redirect_to user_path(@user.id),notice:'Your account was successfully recreated.'
    else
      render :edit
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image,:introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to books_path
    end
  end

end
