angular.module('app.controllers', []).controller('HomeController', ['$scope', 'authService', ($scope, authService) ->
    $scope.user = authService.currentUser()
])