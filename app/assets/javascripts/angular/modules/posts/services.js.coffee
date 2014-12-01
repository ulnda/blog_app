angular.module('app.posts.services', []).factory('Post', ['$resource', 'API_ENDPOINT', ($resource, API_ENDPOINT) ->
    $resource(API_ENDPOINT, { id: '@id' }, {
        update: {
            method: 'PUT'
        }
    })
]).value('API_ENDPOINT', 'http://localhost:3000/users/:user_id/posts/:id')