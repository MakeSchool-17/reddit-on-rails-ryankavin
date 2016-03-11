class PostsController < ApplicationController

	def index
		@posts = Post.all
		render json: {posts: @posts}, status: 200
	end

	def show
		begin
			@post = Post.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@post = nil
		end

		if !@post.nil?
			render json: {post: @post}, status: 200
		else
			render json: {error: "Unable to find post with id #{params[:id]}"}, status: 404
		end
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
		begin
			@post = Post.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@post = nil
		end

		if !@post.nil?
			@post.update(title: params[:title], content: params[:content])
			render json: {post: @post}, status: 201
		else
			render json: {error: "Unable to find post with id #{params[:id]}"}, status: 404
		end
	end

	def destroy
		begin
			@post = Post.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@post = nil
		end

		if !@post.nil?
			@post.destroy
			render json: {post: @post}, status: 204
		else
			render json: {error: "Unable to find post with id #{params[:id]}"}, status: 404
		end
	end
end