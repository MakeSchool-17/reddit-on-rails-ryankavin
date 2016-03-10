class SubRedditsController < ApplicationController

	def index
		@sub_reddit = SubReddit.all
		render json: {status: 200, subreddis: @sub_reddit}
	end

	def show
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

	def new
	end

	def main
	end
end
