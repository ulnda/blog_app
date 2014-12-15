angular.module('app.posts.services', []).factory('Post', ['$resource', 'API_POSTS_ENDPOINT', 'API_POSTS_ACTIONS_ENDPOINT', ($resource, API_POSTS_ENDPOINT, API_POSTS_ACTIONS_ENDPOINT) ->
  $resource(API_POSTS_ACTIONS_ENDPOINT, { id: '@id' }, {
    update: {
      method: 'PUT'
    }
    query: {
      url: API_POSTS_ENDPOINT
      isArray: true
    }
  })
]).value('API_POSTS_ENDPOINT', "#{ location.protocol }//#{ location.host }/users/:user_id/posts/:id").value('API_POSTS_ACTIONS_ENDPOINT', "#{ location.protocol }//#{ location.host }/posts/:id").
factory('Comment', ['$resource', 'API_COMMENTS_ENDPOINT', 'API_COMMENTS_ACTIONS_ENDPOINT', ($resource, API_COMMENTS_ENDPOINT, API_COMMENTS_ACTIONS_ENDPOINT) -> 
  $resource API_COMMENTS_ENDPOINT, { id: '@id' }
]).value('API_COMMENTS_ENDPOINT', "#{ location.protocol }//#{ location.host }/posts/:post_id/comments/:id").value('API_COMMENTS_ACTIONS_ENDPOINT', "#{ location.protocol }//#{ location.host }/comments/:id")