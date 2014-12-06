json.array! @posts do |post|
	json.id			 		  post.id
	json.title	 		  post.title
	json.author_name  post.user.name
	json.author_login post.user.login
	json.created_at   post.created_at
end