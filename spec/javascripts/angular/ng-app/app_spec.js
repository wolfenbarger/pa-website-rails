describe('AuthCtrl', function() {
	var createController, $controller;
	var WindowMock = {};
	var ModalMock = {};
	var AuthServiceMock = { getUserInfo: function() { return {}; } };

	beforeEach(function() {
		module('awesomeApp', function ($provide) {
			$provide.value('$window', WindowMock);
			$provide.value('$modal', ModalMock);
			$provide.value('AuthService', AuthServiceMock);
	    });
		inject(function(_$controller_) {
			$controller = _$controller_;
		});
		createController = function() {
			var controller = $controller('AuthCtrl', {'$scope' : {}});
			return controller;
		};
	});

	describe('generic test', function() {
		it('should work', function() {
			var controller = createController();
			expect(true).to.be.true;
		});
	});
  	
});











