describe('AuthCtrl', function() {

	var createController, $controller, AuthCtrl;
	var WindowMock = { location: {} };
	var ModalMock = { open: function() {} };
	var AuthServiceMock = { getUserInfo: function() { return { testValue: "some value" }; } };

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
	beforeEach(function() {
		AuthCtrl = createController();
	});

	describe('AuthCtrl.user', function() {
		it('should be set to whatever AuthService.getUserInfo() returns', function() {
			expect(AuthCtrl.user).to.eql({ testValue: "some value" });
		});
	});

	describe('AuthCtrl.openLoginModal()', function() {
		var modalOpenSpy;
		before(function() {
			modalOpenSpy = sinon.spy(ModalMock, 'open');
			modalOpenSpy.withArgs({
	            animation: true,
	            templateUrl: 'login-modal.html',
	            controller: 'LoginModalCtrl',
	            controllerAs: 'ctrl',
	            size: 'md'
			});
		});
		after(function() {
			modalOpenSpy.restore();
		});
		it('should call $modal.open({...}) with the appropriate paramters exactly once', function() {
			AuthCtrl.openLoginModal();
			expect(modalOpenSpy.calledOnce).to.be.true;
		});
	});

	describe('AuthCtrl.logout()', function() {
		it('should set $window.location.href to "/users/sign_out"', function() {
			WindowMock.location.href = "something/else";
			AuthCtrl.logout();
			expect(WindowMock.location.href).to.equal('/users/sign_out');
		});
	});
  	
});


describe('LoginModalCtrl', function() {

	var createController, $controller, LoginModalCtrl;
	var WindowMock = { location: {} };
	var ModalInstanceMock = { dismiss: function() {} };

	beforeEach(function() {
		module('awesomeApp', function ($provide) {
			$provide.value('$window', WindowMock);
			$provide.value('$modalInstance', ModalInstanceMock);
	    });
		inject(function(_$controller_) {
			$controller = _$controller_;
		});
		createController = function() {
			var controller = $controller('LoginModalCtrl', {'$scope' : {}});
			return controller;
		};
	});
	beforeEach(function() {
		LoginModalCtrl = createController();
	});

	describe('LoginModalCtrl.login(strategy)', function() {
		it('should set $window.location.href to "/users/auth/" + strategy', function() {
			WindowMock.location.href = "something/else";
			LoginModalCtrl.login('someRandomStrategy');
			expect(WindowMock.location.href).to.equal('/users/auth/someRandomStrategy');
		});
	});

	describe('LoginModalCtrl.cancel()', function() {
		var modalInstanceDismissSpy;
		before(function() {
			modalInstanceDismissSpy = sinon.spy(ModalInstanceMock, 'dismiss');
		});
		after(function() {
			modalInstanceDismissSpy.restore();
		});
		it('should call $modalInstance.dismiss() exactly once', function() {
			LoginModalCtrl.cancel();
			expect(modalInstanceDismissSpy.calledOnce).to.be.true;
		});
	});
  	
});







