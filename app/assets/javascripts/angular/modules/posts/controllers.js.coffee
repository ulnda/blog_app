angular.module('app.posts.controllers', []).controller('PostsController', ['$scope', 'Post', ($scope, Post) ->
    $scope.posts = Post.query()
]).controller('PostController', ['$stateParams', '$state', '$scope', 'Post', ($stateParams, $state, $scope, Post) ->
    $scope.closePost = ->
        $state.go('allPosts')

    $scope.post = Post.get({ id:$stateParams.id })
])