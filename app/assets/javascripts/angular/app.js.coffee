@app = angular.module('app', [])

@app.config(['$httpProvider', ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]')
])

@app.run(->
	console.log 'Angular app running'
)