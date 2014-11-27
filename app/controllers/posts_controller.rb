class PostsController < ApplicationController
	before_action :authenticate_user!, except: [ :index, :show ]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.build(post_params)
		unless @post.save
			@errors = [ 'Invalid data' ]
			render 'shared/errors', status: :bad_request
		end
	end

	def update
		@post = current_user.posts.find(params[:id])
		unless @post.update(post_params)
			@errors = [ 'Invalid data' ]
			render 'shared/errors', status: :bad_request
		end
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.destroy
	end

	private

		def post_params
			params.require(:post).permit(:title, :content)
		end
end
