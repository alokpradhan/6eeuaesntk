class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      sign_in(@user)
      flash[:success] = "Welcome!"
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Invalid credentials. Try again or sign up."
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out"
    redirect_to root_path
  end

end
