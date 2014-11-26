angular.module('app.controllers', []).controller('HomeController', ['$scope', 'authService', '$rootScope', ($scope, authService, $rootScope) ->
		$rootScope.user = authService.currentUser()
		$rootScope.header = true

		$rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
			$rootScope.header =	toState.controller isnt "SignInController"
])