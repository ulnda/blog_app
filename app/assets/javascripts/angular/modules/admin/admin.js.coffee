angular.module('app.admin', ['ui.router', 'app.admin.controllers']).config(['$stateProvider','$locationProvider', ($stateProvider, $locationProvider) ->
	$stateProvider.state('signIn',
		url: '/admin/sign_in'
		templateUrl: 'modules/admin/sign_in.html'
		controller: 'SignInController'
	).state('signOut',
		url: '/admin/sign_out'
		templateUrl: 'modules/admin/sign_out.html'
		controller: 'SignOutController'
	)

	$locationProvider.html5Mode(true)
])