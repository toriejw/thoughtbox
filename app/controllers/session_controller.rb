class SessionController < ApplicationController

  def new
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:errors] = "Invalid login credentials."
      redirect_to login_path
    end
  end

end
