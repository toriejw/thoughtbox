class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_params["password"] != user_params["password_confirmation"]
      flash[:notice] = "Your password and password confirmation do not match. Try again."
      redirect_to register_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to root_path
      end
    end

  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
