class PostsController < ApplicationController
	before_action :authenticate_user!, except: [ :index, :show ]

	def index
		@posts = User.find_by(login: params[:user_id]).posts
	end

	def show
		@post = Post.find(params[:id])
	end

	def by_current_user
		@posts = current_user.posts
		render 'index'
	end

	def create
		@post = current_user.posts.build(post_params)
		unless @post.save
			@errors = [ 'Invalid data' ]
			render 'shared/errors', status: :bad_request
		else
			render nothing: true, status: :ok
		end
	end

	def update
		@post = current_user.posts.find(params[:id])
		unless @post.update(post_params)
			@errors = [ 'Invalid data' ]
			render 'shared/errors', status: :bad_request
		else
			render nothing: true, status: :ok
		end
	end

	def destroy
		current_user.posts.find(params[:id]).destroy
		render nothing: true, status: :ok
	end

	private

		def post_params
			params.require(:post).permit(:title, :content)
		end
end
