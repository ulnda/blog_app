angular.module('app.posts.controllers', []).controller('PostsController', ['$scope', 'Post', '$stateParams', '$rootScope', ($scope, Post, $stateParams, $rootScope) ->
		$scope.posts  = Post.query({ user_id: $stateParams.user_id })
		$rootScope.userId = $stateParams.user_id
]).controller('PostController', ['$stateParams', '$state', '$scope', 'Post', ($stateParams, $state, $scope, Post) ->
    $scope.closePost = ->
        $state.go('allPosts', { user_id: $scope.userId })

    $scope.post = Post.get({ id: $stateParams.id, user_id: $scope.userId })
])