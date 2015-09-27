var services = angular.module('services',[]);

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