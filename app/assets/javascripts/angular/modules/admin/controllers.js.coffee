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
]).controller('AdminController', [ ->

]).controller('AdminNewPostController', ['$scope', 'Post', '$state', ($scope, Post, $state) ->
	$scope.post = new Post()
	$scope.buttonText = 'Save'
	$scope.createPost = ->
		$scope.buttonText="Saving...";
		$scope.post.permalink=angular.lowercase($scope.post.title).replace(/[\s]/g,'-');
		$scope.post.$save ->
			$state.go('admin.allPosts')
]).controller('AdminPostsController', [ ->

])