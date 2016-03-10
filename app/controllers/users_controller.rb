class UsersController < ApplicationController


  def index
    @user = User.all
    render json: {status: 200, users: @user}
  end

  def show
    @user = User.find(params[:id])
    render json: {status: 200, user: @user}
  end

  def create
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    render json: {status: 200, user: @user}
  end



end
