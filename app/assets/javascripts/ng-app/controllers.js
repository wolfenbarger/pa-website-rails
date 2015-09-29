var controllers = angular.module('controllers',[
	'ui.bootstrap', 
	'services'
]);

controllers.controller('AuthCtrl', ['$window', '$modal', 'AuthService', function($window, $modal, AuthService) {
	var vm = this;
	vm.user = AuthService.getUserInfo();

	vm.openLoginModal = function() {
        $modal.open({
            animation: true,
            templateUrl: 'login-modal.html',
            controller: 'LoginModalCtrl',
            controllerAs: 'ctrl',
            size: 'md'
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







