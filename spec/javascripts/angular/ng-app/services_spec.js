describe('AuthService', function() {
	var AuthService;
	var CookiesMock = { get: function() {} };
	beforeEach(function() {
		module('awesomeApp', function ($provide) {
			$provide.value('$cookies', CookiesMock);
	    });
	    inject(function(_AuthService_) {
	    	AuthService = _AuthService_; 
	    });
	});
	
	describe('AuthService.isAuthenticated()', function() {
		describe('when $cookies.get("user_id") is undefined', function() {
			var cookiesGetStub;
			before(function() {
				cookiesGetStub = sinon.stub(CookiesMock, "get", function() { return undefined; });
				cookiesGetStub.withArgs('user_id');
			});
			after(function() {
				cookiesGetStub.restore();
			});
			it('should return false', function() {
				expect(AuthService.isAuthenticated()).to.be.false;
			});
		});
		describe('when $cookies.get("user_id") is defined', function() {
			var cookiesGetStub;
			before(function() {
				cookiesGetStub = sinon.stub(CookiesMock, "get", function() { return 0; });
				cookiesGetStub.withArgs('user_id');
			});
			after(function() {
				cookiesGetStub.restore();
			});
			it('should return true', function() {
				expect(AuthService.isAuthenticated()).to.be.true;
			});
		});
	});

	describe('AuthService.getUserInfo()', function() {
		var isAuthenticatedStub;
		before(function() {
			CookiesMock.get = function(key) {
				console.log(key);
				if (key == 'user_id') return 42;
				if (key == 'user_name') return 'some name';
			};
		});
		describe('when user AuthService.isAuthenticated() is false', function() {
			var userInfo;
			before(function() {
				isAuthenticatedStub = sinon.stub(AuthService, "isAuthenticated", function(){ return false; });
				userInfo = AuthService.getUserInfo();
			});
			after(function() {
				isAuthenticatedStub.restore();
			});
			it('should return an object', function() {
				expect(userInfo).to.be.an('object');
			});
			describe('user info properties', function() {
				describe('isAuthenticated', function() {
					it('should be false', function() {
						expect(userInfo.isAuthenticated).to.be.false;
					});
				});
			});
		});
		describe('when user AuthService.isAuthenticated() is true', function() {
			var userInfo;
			before(function() {
				isAuthenticatedStub = sinon.stub(AuthService, "isAuthenticated", function(){ return true; });
				userInfo = AuthService.getUserInfo();
			});
			after(function() {
				isAuthenticatedStub.restore();
			});
			it('should return an object', function() {
				expect(userInfo).to.be.an('object');
			});
			describe('user info properties', function() {
				describe('isAuthenticated', function() {
					it('should be true', function() {
						expect(userInfo.isAuthenticated).to.be.true;
					});
				});
				describe('id', function() {
					it('should be 42', function() {
						expect(userInfo.id).to.equal(42);
					});
				});
				describe('name', function() {
					it('should be "some name"', function() {
						expect(userInfo.name).to.equal("some name");
					});
				});
			});
		});
	});

});








