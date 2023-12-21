class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]

    if email.present? && password.present?
      @user = User.find_by(email: email)

      if @user&.valid_password?(password)
        sign_in(@user) # Use Devise's sign_in method to authenticate the user
        redirect_to my_blogs_path, notice: 'Sign In Success!'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    else
      flash.now[:alert] = 'Email and password are required'
      render :new
    end
  end

  def destroy
    sign_out(current_user) # Use Devise's sign_out method
    flash[:success] = "You have logged out!"
    redirect_to root_path
  end
end