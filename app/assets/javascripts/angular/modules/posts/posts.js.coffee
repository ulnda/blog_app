angular.module('app.posts', ['ui.router', 'app.posts.services', 'app.posts.controllers']).config(['$stateProvider','$locationProvider', ($stateProvider, $locationProvider) ->
	$stateProvider.state('allPosts',
		url: '/users/:user_id'
		templateUrl: 'modules/posts/posts.html'
		controller: 'PostsController'
	).state('singlePost',
		url: '/users/:user_id/posts/:id'
		templateUrl: 'modules/posts/single_post.html'
		controller: 'PostController'
	).state('home',
		url: '/'
		templateUrl: 'home.html'
		controller: 'HomeController')

	$locationProvider.html5Mode(true)
])