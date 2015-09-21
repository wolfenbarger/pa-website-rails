awesomeApp = angular.module('awesomeApp', [
	'ngCookies', 
	'templates', 
	'ui.router',
	'ui.bootstrap',
	'controllers',
	'services'
]);

awesomeApp.config(['$stateProvider', '$locationProvider', function($stateProvider, $locationProvider) {
    
	$locationProvider.html5Mode({
		enabled: true
	});
	
	$stateProvider
	.state('home', {
		url: '/',
		templateUrl: 'index.html'
	});

}]);

controllers = angular.module('controllers',[
	'ui.bootstrap', 
	'services'
]);

controllers.controller('AuthCtrl', ['$window', '$modal', 'AuthService', function($window, $modal, AuthService) {
	var vm = this;
	vm.user = AuthService.getUserInfo();

	vm.openLoginModal = function() {
        var modalInstance = $modal.open({
            animation: true,
            templateUrl: 'login-modal.html',
            controller: 'LoginModalCtrl',
            controllerAs: 'ctrl',
            size: 'md'
        });
        modalInstance.result.then(function () {

        }, function() {

        });
	}
	vm.logout = function() {
		$window.location.href = "/users/sign_out";
	}

	return vm;
}]);

controllers.controller("LoginModalCtrl", ['$window', '$modalInstance', function($window, $modalInstance) {
    var vm = this;

	vm.login = function(strategy) {
        $window.location.href = "/users/auth/" + strategy;
	}
    vm.cancel = function () {
        $modalInstance.dismiss();
    };
}]);

services = angular.module('services',[]);

services.factory("AuthService",['$cookies', function($cookies) {
    var authService = {};
	authService.isAuthenticated = function() {
		return (typeof $cookies.get('user_id') !== 'undefined');
	}
    authService.getUserInfo = function() {
    	var userInfo = { isAuthenticated: authService.isAuthenticated() }
    	if (userInfo.isAuthenticated) {
    		userInfo.id = $cookies.get('user_id');
    		userInfo.name = $cookies.get('user_name');
    	}
        return userInfo;
    }
	return authService;
}]);











