angular.module('app.admin', ['ui.router', 'app.admin.controllers']).config(['$stateProvider','$locationProvider', ($stateProvider, $locationProvider) ->
	$stateProvider.state('signIn'
		url: '/admin/sign_in'
		templateUrl: 'modules/admin/sign_in.html'
		controller: 'SignInController'
	).state('signOut'
		url: '/admin/sign_out'
		templateUrl: 'modules/admin/sign_out.html'
		controller: 'SignOutController'
	).state('admin'
		url: '/admin'
		abstract: true
		controller: 'AdminController'
		templateUrl: 'modules/admin/home.html'
	).state('admin.newPost'
		url: '/posts/new'
		controller: 'AdminNewPostController'
		templateUrl: 'modules/admin/new_post.html'
	).state('admin.editPost'
		url: '/posts/:id/edit'
		controller: 'AdminEditPostController'
		templateUrl: 'modules/admin/edit_post.html'
	).state('admin.allPosts'
		url: '/posts'
		controller: 'AdminPostsController'
		templateUrl: 'modules/admin/posts.html'
	)

	$locationProvider.html5Mode(true)
])