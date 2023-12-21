class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to my_blogs_path, notice: 'Signup successful!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end