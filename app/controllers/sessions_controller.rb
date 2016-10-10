class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:username])

    unless user.nil?
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end
end
