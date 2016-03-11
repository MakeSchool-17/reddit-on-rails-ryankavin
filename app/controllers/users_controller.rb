class UsersController < ApplicationController


  def index
    @user = User.all
    render json: {users: @user}, status: 200
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @user = nil
    end
    
    if !@user.nil?
      render json: {user: @user}, status: 200
    else
      render json: {error: "User with id cannot be found."}, status: 500
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {created_user: @user}, status: 201
    else
      render json: {error: "Error occurred while making an user account"}, status: 500
    end
  end

  def update
		@user = User.find(params[:id])
		if @user.nil?
			render json: {error: "User with certain id cannot be found" }, status: 503
		else
			if @user.update(user_params)
				render json: {updated_user: @user}, status: 201
			else
				render json: {error: "Failed updating user information. More information: #{@user.errors.full_messages}"}, status: 500
			end
		end
	end

  def destroy
		@user = User.find(params[:id])
		if @user.destroy
			render json: {deleted_user: @user}, status: 204
		else
			render json: {error: "Error occurred while deleting a user. More information: #{@user.errors.full_messages}"}, status: 500
		end
	end


private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
