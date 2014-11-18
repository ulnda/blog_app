angular.module('app.posts', ['ui.router', 'app.posts.services', 'app.posts.controllers']).config(['$stateProvider','$locationProvider', ($stateProvider, $locationProvider) ->
	$stateProvider.state('allPosts',
		url: '/posts'
		templateUrl: 'modules/posts/posts.html'
		controller: 'PostsController'
	).state('singlePost',
		url: '/posts/:id'
		templateUrl: 'modules/posts/single_post.html'
		controller: 'PostController'
	)

	$locationProvider.html5Mode(true)
])