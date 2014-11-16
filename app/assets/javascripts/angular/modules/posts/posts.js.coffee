angular.module('app.posts', ['ui.router', 'templates']).config(['$stateProvider','$locationProvider', ($stateProvider, $locationProvider) ->
	$stateProvider.state('allPosts',
		url: '/posts'
		templateUrl: 'modules/posts/posts.html'
	)

	$locationProvider.html5Mode(true)
])