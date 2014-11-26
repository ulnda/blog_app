angular.module('app.admin.controllers', []).controller('SignInController', ['$scope', 'authService', '$state', '$rootScope', ($scope, authService, $state, $rootScope) ->
	$scope.buttonText = "Login"
	
	$scope.login = ->
		$scope.buttonText="Logging in. . ."
		
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
])