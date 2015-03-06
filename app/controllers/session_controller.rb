class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate(params[:user])

    if @user
      login_as(@user)
      redirect_to projects_path
    else
      flash.now[:notice] = "Email or password is incorrect"
      render "new"
    end
  end

  def destroy
  end

end
