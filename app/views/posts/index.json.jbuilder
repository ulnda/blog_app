json.array! @posts do |post|
	json.id			 		post.id
	json.title	 		post.title
	json.author  		post.user.name
	json.created_at post.created_at
end