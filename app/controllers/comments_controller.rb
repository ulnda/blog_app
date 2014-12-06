class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = current_user.comments.build(post: Post.find(params[:post_id]), content: params[:comment][:content])
		unless @comment.save
			@errors = [ 'Invalid data' ]
			render 'shared/errors', status: :bad_request
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :post_id)
		end
end
