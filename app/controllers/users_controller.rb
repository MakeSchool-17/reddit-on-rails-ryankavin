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
    render json: {status: 201, created_user: @user}
  end

  def update
    @user = User.find(params[:id])
    @user.update(username: params[:username], email: params[:email], password: params[:password])
    render json: {status: 201, updated_user: @user}
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {status: 204, destroyed_user: @user}
  end

end
