var awesomeApp = angular.module('awesomeApp', [
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










