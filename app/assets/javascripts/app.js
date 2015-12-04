var portfolio = angular.module('portfolio', []);

portfolio.controller('experienceController', ['$scope', '$http', '$log',  function($scope, $http, $log) {
	$scope.job = "";

	$http({
		method: 'GET',
		url: '/jobs.JSON',
	}).then(function successCallback(response) {
			$scope.job_result = response;
			$log.info($scope.job_result);
	}, function errorCallback(response) {
			$scope.job_result = response;
			$log.info($scope.job_result);
	});

}]);