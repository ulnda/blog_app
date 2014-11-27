angular.module('app.admin.controllers', []).controller('SignInController', ['$scope', 'authService', '$state', '$rootScope', ($scope, authService, $state, $rootScope) ->
	$scope.buttonText = "Login"
	
	$scope.login = ->
		$scope.buttonText="Logging in..."
		
		authService.signIn($scope.credentials).then (response, status) ->
			$rootScope.user = authService.currentUser()
			$state.go('allPosts')
		, (error) ->
			$scope.invalidLogin = true
			$scope.buttonText = "Login"
]).controller('SignOutController', ['$scope', 'authService', '$state', '$rootScope', ($scope, authService, $state, $rootScope) -> 
	authService.signOut().then ->
		$rootScope.user = null
		$state.go('signIn')
	, (error) ->
		console.log(error)
]).controller('AdminNewPostController', ['$scope', 'Post', '$state', ($scope, Post, $state) ->
	$scope.post = new Post()
	$scope.buttonText = 'Save'
	$scope.createPost = ->
		$scope.buttonText="Saving...";
		$scope.post.$save ->
			$state.go('admin.allPosts')
]).controller('AdminPostsController', ['$scope', 'Post', '$state', ($scope, Post, $state)->
	$scope.posts = Post.query()
	$scope.deletePost = (post) ->
		post.$delete ->
			$state.go('admin.allPosts', undefined, { reload : true })
]).controller('AdminEditPostController', ['$scope', 'Post', '$state', '$stateParams', ($scope, Post, $state, $stateParams) ->
	$scope.post = Post.get({ id : $stateParams.id })
	$scope.buttonText = "Update"
	$scope.updatePost = ->
		$scope.buttonText = "Updating..."
		$scope.post.$update ->
			$state.go('admin.allPosts');
])