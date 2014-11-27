class PostsController < ApplicationController
	before_action :authenticate_user!, only: [ :create ]

	def index
		@posts = Post.all.reverse_order
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		render json: current_user
	end

	private

		def post_params
			params.require(:post).permit(:title, :content)
		end
end
