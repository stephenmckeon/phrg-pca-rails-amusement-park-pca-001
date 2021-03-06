class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    # "user"=>{"name"=>"diosu"}, "password"=>"fdsfdsfds"
    @user = User.find_by(name: params[:user][:name])
    # might be interesting to look at later
    return unless @user.authenticate(params[:password])

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end
