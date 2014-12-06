angular.module('app.posts.controllers', []).controller('PostsController', ['$scope', 'Post', '$stateParams', '$rootScope', ($scope, Post, $stateParams, $rootScope) ->
		$rootScope.userId = $stateParams.user_id

		$scope.itemsPerPage = 10

		$scope.allPosts = Post.query({ user_id: $stateParams.user_id }, (response) ->
			$scope.totalItems = $scope.allPosts.length
			$scope.posts = $scope.allPosts.slice(0, $scope.itemsPerPage)
		)
		
		$scope.currentPage = 1
		$scope.setPage = (pageNum) ->
			$scope.currentPage = pageNum
		$scope.pageChanged = ->
			begin = ($scope.currentPage - 1) * $scope.itemsPerPage
			end = begin + $scope.itemsPerPage 
			$scope.posts = $scope.allPosts.slice(begin, end)

]).controller('PostController', ['$stateParams', '$state', '$scope', 'Post', ($stateParams, $state, $scope, Post) ->
    $scope.closePost = ->
        $state.go('allPosts', { user_id: $scope.userId })

    $scope.post = Post.get({ id: $stateParams.id, user_id: $scope.userId })
])