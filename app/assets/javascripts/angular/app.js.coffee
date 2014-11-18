@app = angular.module('app', ['app.posts', 'ui.router', 'templates', 'ngResource'])

@app.config(['$httpProvider', ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]')
])

@app.run(['$state', ($state) ->
	console.log 'Angular app running'
	$state.go('allPosts')
])