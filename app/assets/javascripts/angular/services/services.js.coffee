angular.module('app.services', []).factory('authService', ['SIGN_IN_ENDPOINT', 'SIGN_OUT_ENDPOINT', '$http', '$cookieStore', (SIGN_IN_ENDPOINT, SIGN_OUT_ENDPOINT, $http, $cookieStore) ->

	auth = {}
	auth.signIn = (credentials) ->
		return $http.post(SIGN_IN_ENDPOINT, { user: credentials }).then (response, status) ->
			$cookieStore.put('user', response.data)
		, (error) ->
			console.log("Incorrect email/password")
	auth.currentUser = ->
		$cookieStore.get('user')

	auth
]).value('SIGN_IN_ENDPOINT', 'http://localhost:3000/api/users/sign_in').value('SIGN_OUT_ENDPOINT', 'http://localhost:3000/api/users/sign_out')