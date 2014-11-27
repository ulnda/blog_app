angular.module('app.controllers', []).controller('HomeController', ['$scope', 'authService', '$rootScope', '$state', ($scope, authService, $rootScope, $state) ->
	$rootScope.user = authService.currentUser()
	$rootScope.header = true

	$rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
		$rootScope.header =	toState.controller isnt "SignInController"

	$rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
		if error.unAuthorized
			$state.go('signIn')
		else if error.authorized
			console.log(111)
			$state.go('allPosts')
])