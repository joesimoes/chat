class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])

    unless user.nil?
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in"
    else
      @user = User.new(session_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Account created"
      else
        render "new"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end

  def session_params
    params.permit(:username)
  end
end
