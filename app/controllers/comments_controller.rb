class CommentsController < ApplicationController

	def index
		@comments = Comment.all
		render json: {comments: @comments}, status: 200
	end

	def show
		begin
			@comment = Comment.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@comment = nil
		end

		if !@comment.nil?
			render json: {comment: @comment}, status: 200
		else
			render json: {error: "Unable to find comment with id #{params[:id]}"}, status: 404
		end
	end

	def create
		@comment = Comment.create(content: params[:content])
		if !@comment.content.nil?
			render json: {comment: @comment}, status: 200
		else
			render json: {error: "Unable to create comment"}, status: 503
		end
	end

	def update
		begin
			@comment = Comment.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@comment = nil
		end

		if !@comment.nil?
			@comment.update(content: params[:content])
			render json: {comment: @comment}, status: 200
		else
			render json: {error: "Unable to find comment with id #{params[:id]}"}, status: 404
		end
	end

	def destroy
		begin
			@comment = Comment.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			@comment = nil
		end

		if !@comment.nil?
			@comment.destroy
			render json: {comment: @comment}, status: 204
		else
			render json: {error: "Unable to find comment with id #{params[:id]}"}, status: 404
		end
	end
end
