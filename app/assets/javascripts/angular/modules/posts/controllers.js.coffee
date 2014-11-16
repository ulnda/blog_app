angular.module('app.posts.controllers', []).controller('PostsController', ['$scope', 'Post', ($scope, Post) ->

    $scope.posts = Post.query()
])