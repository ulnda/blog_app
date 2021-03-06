angular.module('app.admin.controllers', []).controller('SignInController', ['$scope', 'authService', '$state', '$rootScope', ($scope, authService, $state, $rootScope) ->
	$scope.buttonText = "Login"
	
	$scope.login = ->
		$scope.buttonText = "Logging in..."
		
		authService.signIn($scope.credentials).then (response, status) ->
			$rootScope.user = authService.currentUser()
			$state.go('home')
		, (error) ->
			$scope.invalidLogin = true
			$scope.buttonText = "Login"
]).controller('SignOutController', ['$scope', 'authService', '$state', '$rootScope', ($scope, authService, $state, $rootScope) -> 
	authService.signOut().then ->
		delete $rootScope.user
		$state.go('signIn')
	, (error) ->
		console.log(error)
]).controller('AdminNewPostController', ['$scope', 'Post', '$state', ($scope, Post, $state) ->
	$scope.post = new Post()
	$scope.buttonText = 'Save'

	$scope.createPost = ->
		$scope.buttonText = "Saving..."
		$scope.post.$save ->
			$state.go('admin.allPosts')
]).controller('AdminPostsController', ['$scope', 'Post', '$state', ($scope, Post, $state)->
	$scope.posts = Post.query({ user_id: 'current_user' })

	$scope.deletePost = (post) ->
		post.$delete ->
			$scope.posts.splice($scope.posts.indexOf(post), 1)
]).controller('AdminEditPostController', ['$scope', 'Post', '$state', '$stateParams', 'Comment', ($scope, Post, $state, $stateParams, Comment) ->
	$scope.post = Post.get({ id : $stateParams.id })
	$scope.buttonText = "Update"

	$scope.updatePost = ->
		$scope.buttonText = "Updating..."
		$scope.post.$update ->
			$state.go('admin.allPosts')

	$scope.deleteComment = (comment) ->
		(new Comment({ id: comment.id })).$delete { post_id: $scope.post.id }, ->
			$scope.post.comments.splice($scope.post.comments.indexOf(comment), 1)
])