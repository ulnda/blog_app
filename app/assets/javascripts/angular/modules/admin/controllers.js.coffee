angular.module('app.admin.controllers', []).controller('SignInController', ['$scope', 'authService', '$state', ($scope, authService, $state) ->
	$scope.buttonText = "Login"
	
	$scope.login = ->
		$scope.buttonText="Logging in. . ."
		
		authService.signIn($scope.credentials).then((response, status) ->
			$state.go('allPosts')
		, ->
			$scope.invalidLogin = true
			$scope.buttonText = "Login"
		)
])