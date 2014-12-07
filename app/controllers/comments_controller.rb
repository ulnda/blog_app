class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = current_user.comments.build(post: Post.find(params[:post_id]), content: params[:comment][:content])
		unless @comment.save
			@errors = [ 'Invalid data' ]
			render 'shared/errors', status: :bad_request
		end
	end

	def destroy
		current_user.posts.find(params[:post_id]).comments.find(params[:id]).destroy
		render nothing: true, status: :ok
	end
end
