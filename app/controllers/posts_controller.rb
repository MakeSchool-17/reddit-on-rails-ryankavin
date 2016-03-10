class PostsController < ApplicationController

	def index
		@posts = Post.all
		render json: {posts: @posts}, status: 200
	end

	def show
		@post = Post.find(params[:id])
		render json: {post: @post}, status: 200
	end

	def create
		@post = Post.create(title: params[:title], content: params[:content])
		if @post.nil?
			render json: {post: @post}, status: 201
		else
			render json: {error: "An error"}, status: 503
		end
	end

	def update
		@post = Post.find(params[:id])
		@post.update(title: params[:title], content: params[:content])
		render json: {post: @post}, status: 201
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		render json: {post: @post}, status: 204
	end
end