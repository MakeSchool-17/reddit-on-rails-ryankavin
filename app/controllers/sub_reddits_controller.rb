class SubRedditsController < ApplicationController

	def index
		@sub_reddit = SubReddit.all
		render json: {subreddits: @sub_reddit}, status: 200
	end

	# def show_by_name
	# 	@sub_reddit = SubReddit.find(params[:id])
	# 	render json: {status: 200, subreddit: @sub_reddit}
	# end

	def create
		@sub_reddit = SubReddit.new(sub_reddit_params)
		if @sub_reddit.save
			render json: {created_subreddits: @sub_reddit}, status: 201
		else
			render json: {error: @sub_reddit.errors.full_messages}, status: 500
		end
	end

	def destroy
		@sub_reddit = SubReddit.find(params[:id])
		if @sub_reddit.destroy
			render json: {destroyed_subreddits: @sub_reddit}, status: 204
		else
			render json: {error: "Error occurred while deleting a SubReddit. More information: #{@sub_reddit.errors.full_messages}"}, status: 500
		end
	end

	def update
		@sub_reddit = SubReddit.find(params[:id])
		if @sub_reddit.nil?
			render json: {error: "SubReddit with certain id cannot be found" }, status: 503
		else
			if @sub_reddit.update(sub_reddit_params)
				render json: {updated_subreddit: @sub_reddit}, status: 201
			else
				render json: {error: "Failed updating Subreddit information. More information: #{@sub_reddit.errors.full_messages}"}, status: 500
			end
		end
	end

	def show_by_slug
		slug = params[:slug]
		begin
			@sub_reddit = SubReddit.find_by(slug: slug)
		rescue ActiveRecord::RecordNotFound => e
			@sub_reddit = nil
		end

		if @sub_reddit != nil
			render json: {subreddits: @sub_reddit}, status: 200
		else
			render json: {error: "SubReddit with certain slug is not found."}, status: 500
		end
	end


	private

    def sub_reddit_params
      params.require(:sub_reddit).permit(:title, :description)
    end

end
