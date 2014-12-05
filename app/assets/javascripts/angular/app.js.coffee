angular.module('app', ['app.posts', 'app.admin', 'app.services', 'app.controllers', 'ui.router', 'templates', 'ngResource', 'Devise', 'ngCookies', 'ui.bootstrap']).config(['$httpProvider', '$stateProvider', ($httpProvider, $stateProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]')
])