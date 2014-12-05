angular.module('app.controllers', []).controller('MainController', ['$scope', 'authService', '$rootScope', '$state', ($scope, authService, $rootScope, $state) ->
	$rootScope.user = authService.currentUser()

	$rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
		if error.unAuthorized
			$state.go('signIn')
		else if error.authorized
			$state.go('home')
]).controller('HomeController', ['$scope', 'authService', '$rootScope', '$state', 'User', ($scope, authService, $rootScope, $state, User) ->
	$scope.users = User.query()
	delete $rootScope.userId
])