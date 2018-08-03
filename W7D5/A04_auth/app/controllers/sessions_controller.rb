class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      username: params[:user][:username],
      password: params[:user][:password]
    )
    if @user
      login!(@user)
      redirect_to links_url
    else
      flash.now[:errors] = ["invalid"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
