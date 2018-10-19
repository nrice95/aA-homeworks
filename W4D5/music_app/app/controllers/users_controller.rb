class UsersController < ApplicationController
  def new
    # debugger
    render :new
  end

  def create
    # debugger

    @user = User.new(user_params)

    # debugger
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    render :show
  end

  def index
    render :index
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end
end
