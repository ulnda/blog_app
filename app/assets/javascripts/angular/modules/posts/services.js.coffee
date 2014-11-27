angular.module('app.posts.services', []).factory('Post', ['$resource', 'API_ENDPOINT', ($resource, API_ENDPOINT) ->
    $resource(API_ENDPOINT, { id: '@_id' }, {
        update: {
            method: 'PUT'
        }
    })
]).value('API_ENDPOINT', 'http://localhost:3000/posts/:id')