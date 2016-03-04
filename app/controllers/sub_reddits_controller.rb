class SubRedditsController < ApplicationController

	def index
	end

	def show
		#@sub_reddit
	end

	def show_by_slug
		slug = params[:slug]
		@sub_reddit = SubReddit.find_by(slug: slug)
		render 'sub_reddits/show'
	end

	def new
	end
end
