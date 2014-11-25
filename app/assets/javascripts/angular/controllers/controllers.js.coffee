angular.module('app.controllers', []).controller('HomeController', ['$scope', 'authService', '$rootScope', ($scope, authService, $rootScope) ->
    $rootScope.user = authService.currentUser()
])