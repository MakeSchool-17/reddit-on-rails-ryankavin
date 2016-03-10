class SubRedditsController < ApplicationController

	def index
		@sub_reddit = SubReddit.all
		render json: {status: 200, subreddits: @sub_reddit}
	end

	def show
		@sub_reddit = SubReddit.find(params[:id])
		render json: {status: 200, subreddit: @sub_reddit}
	end

	def create
		@sub_reddit = SubReddit.create(title: params[:title], description: params[:description])
		render json: {status: 201, created_subreddits: @sub_reddit}
	end

	def destroy
		@sub_reddit = SubReddit.find(params[:id])
		@sub_reddit.destroy
		render json: {status: 204, destroyed_subreddits: @sub_reddit}
	end

	def update
		@sub_reddit = SubReddit.find(params[:id])
		@sub_reddit.update(title: params[:title], description: params[:description])
		render json: {status: 201, updated_subreddit: @sub_reddit}
	end

	def show_by_slug
		slug = params[:slug]
		@sub_reddit = SubReddit.find_by(slug: slug)
		if @sub_reddit != nil
			render 'sub_reddits/show'
		else
			head :not_found
		end
	end

end
