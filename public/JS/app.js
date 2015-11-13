var portfolioApp = angular.module('portfolioApp', ['ngRoute']);

portfolioApp.config(['$routeProvider', function($routeProvider){
	$routeProvider
	.when('/', {
		templateUrl: '/app/pages/main.html',
		controller: 'mainController',
	})

	.when('/contact', {
		templateUrl: '/app/pages/contact.html',
		controller: 'mainController',
	})

	.when('/experience', {
		templateUrl: '/app/pages/experience.html',
		controller: 'mainController'
	})

	.when('/404', {
		templateUrl: '/app/pages/404.html',
		controller: 'mainController'
	})

	.when('/qualifications', {
		templateUrl: '/app/pages/qualification.html',
		controller: 'mainController'
	})

	.otherwise({ redirectTo: '/404' });
}]);

portfolioApp.controller('mainController', ['$scope', '$log', '$http' , function($scope, $log, $http){

$scope.job = "";
$scope.qualification = "";

	$http({
		method: 'GET',
		url: '/app/JS/jobs.JSON',
	}).then(function successCallback(response) {
			$scope.job_result = response;
			$log.info($scope.job_result);
	}, function errorCallback(response) {
			$scope.job_result = response;
			$log.info($scope.job_result);
	});

	$http({
		method: 'GET',
		url: '/app/JS/qualification.JSON',
	}).then(function successCallback(response) {
		$scope.qualification_result = response;
	}, function errorCallback(response) {
		$scope.qualification_result = response;
	});

}]);