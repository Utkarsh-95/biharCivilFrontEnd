document.onreadystatechange = function() {
	var state = document.readyState;
	if (state == 'interactive') {
		document.getElementById('contents').style.visibility = "hidden";
	} else if (state == 'complete') {
		setTimeout(function() {
			document.getElementById('interactive');
			document.getElementById('load').style.visibility = "hidden";
			document.getElementById('contents').style.visibility = "visible";
		}, 1000);
	}
}

var appControl = angular.module('appControl', [ 'ngRoute',
		'angularUtils.directives.dirPagination' ]);

appControl.config(function($routeProvider) {
	
	$routeProvider.when('/dashboard', {
		templateUrl : 'dashboard',
		controller : 'dashboardCtrl'

	}).when('/dashblock1', {
		templateUrl : 'dashblock1',
		controller : 'dashblockCtrl'

	}).when('/dashblock2', {
		templateUrl : 'dashblock2',
		controller : 'dashblockCtrl'

	}).when('/dashblock3', {
		templateUrl : 'dashblock3',
		controller : 'dashblockCtrl'

	}).when('/dashblock4', {
		templateUrl : 'dashblock4',
		controller : 'dashblockCtrl'

	}).when('/recoverpasswords', {
		templateUrl : 'recoverpasswords'

	}).when('/error', {
		templateUrl : 'error'

	}).when('/devicemanagement', {
		templateUrl : 'devicemanagement',
		controller : 'deviceManagementCtrl'

	}).when('/vehiclemanagement', {
		templateUrl : 'vehiclemanagement',
		controller : 'vehicleManagementCtrl'

	}).when('/admin/adddevice', {
		templateUrl : '/admin/adddevice',
		controller : 'addDeviceCtrl'

	}).when('/admin/addvehicle', {
		templateUrl : '/admin/addvehicle',
		controller : 'addVehicleCtrl'

	}).when('/devicevehiclemanagement', {
		templateUrl : 'devicevehiclemanagement',
		controller : 'deviceVehicleManagementCtrl'

	}).when('/devicevehiclemanagementdetails', {
		templateUrl : 'devicevehiclemanagementdetails',
		controller : 'deviceVehicleManagementDetailsCtrl'

	}).when('/alertnotify', {
		templateUrl : 'alertnotify',
		controller : 'alertNotifyCtrl'

	}).when('/admin/usermanagement', {
		templateUrl : '/admin/usermanagement',
		controller : 'userManagementCtrl'

	}).when('/admin/usermanagementview', {
		templateUrl : '/admin/usermanagementview',
		controller : 'userManagementViewCtrl'

	}).otherwise({
		redirectTo : '/dashboard'
	});
});