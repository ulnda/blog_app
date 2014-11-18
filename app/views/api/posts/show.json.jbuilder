json.id			 		@post.id
json.title	 		@post.title
json.content 		@post.content
json.author  		@post.user.name
json.created_at @post.created_at
json.comments @post.comments do |comment|
	json.id 				comment.id
	json.content 		comment.content
	json.author 		comment.user.name
	json.created_at comment.created_at
end