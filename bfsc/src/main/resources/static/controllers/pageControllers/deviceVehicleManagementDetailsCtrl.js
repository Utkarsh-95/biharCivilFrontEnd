appControl.controller('deviceVehicleManagementDetailsCtrl', function(
		$scope, $http, $compile, $filter, $location, $window) {
	
	$http.get(restUrl+'/api/v1/findAllVehiceJoinDevice').success(
			function(response, status, headers, config) {
				$scope.responseDataVehiceDevice = response;
				$(function() {
					$('#deviceVehicleManagement').DataTable({
						"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
						"dom" : '<"float-left"B><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
						"buttons" : [ 'copy', 'excel', 'pdf' ],
						"responsive" : true,
						"autoWidth" : false

					});
				});
				console.log(response);
			}).error(function(data, status, headers, config) {
		console.log('error: data = ', response);
	});
	
	$scope.deleteVehicleDeviceMapping = function (vehicleNo, deviceImei) {
		
		$http.get(restUrl+'/api/v1/findByDeviceImei/'+deviceImei).success(
				function(response, status, headers, config) {
					
					if(response.dataCount == 1){
						$scope.responseDataDeviceImei = response.data[0].deviceId;
						deviceId = $scope.responseDataDeviceImei;
						$scope.callVehicleUrl(deviceId);
					}else{
						$(document).Toasts('create', {
							 class: 'bg-maroon',
							 title: 'Error',
							 autohide: false,
							 subtitle: 'Device Imei',
							 delay: 5000,
							 icon: 'fa fa-exclamation-circle',
							 body: '<b>'+response.message+'</b>'
					 })
						return response.message;
					}
					
					console.log(response);
				}).error(function(data, status, headers, config) {
			console.log('error: data = ', response);
		});
		
		$scope.callVehicleUrl = function(deviceId){
		
		$http.get(restUrl+'/api/v1/findByVehicleNo/'+vehicleNo).success(
				function(response, status, headers, config) {
											
					if(response.dataCount == 1){
						$scope.responseDataVehicleNo = response.data[0].vehicleId;
						vehicleId = $scope.responseDataVehicleNo;
						$scope.callVehicleDeviceMappingUrl(deviceId, vehicleId);
					}else{
						$(document).Toasts('create', {
							 class: 'bg-maroon',
							 title: 'Error',
							 autohide: false,
							 subtitle: 'Vehicle No',
							 delay: 5000,
							 icon: 'fa fa-exclamation-circle',
							 body: '<b>'+response.message+'</b>'
					 })
						return response.message;
					}
					
					console.log(response);
				}).error(function(data, status, headers, config) {
			console.log('error: data = ', response);
		});
		
		}
		
		$scope.callVehicleDeviceMappingUrl = function(deviceid, vehicleid){
			
			Swal.fire({
				  title: 'Are you sure?',
				  text: "Mapping will be deleted for this : - " + vehicleNo + " and " + deviceImei,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
		      }).then((result) => {
				  if (result.value) {
					  				  
					  $http.post(restUrl+'/api/v1/removeVehicleDeviceMapping', {vehicleId: vehicleid, deviceId: deviceid}, {headers: {'Content-Type': 'application/json'} })
				        .then(function (response) {
//				            console.log(response);				          				            
				            $http.get(restUrl+'/api/v1/findAllVehiceJoinDevice').success(
				    				function(response, status, headers, config) {
				    					$scope.responseDataVehiceDevice = response;
			    						$('#deviceVehicleManagement').DataTable().destroy();			    					
				    					$(function() {
				    						$('#deviceVehicleManagement').DataTable({
				    							"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
				    							"dom" : '<"float-left"B><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
				    							"buttons" : [ 'copy', 'excel', 'pdf' ],
				    							"responsive" : true,
				    							"autoWidth" : false

				    						});
				    					});
				    					console.log(response);
				    				}).error(function(data, status, headers, config) {
				    			console.log('error: data = ', response);
				    		});
				        });
					  /*Swal.fire(
		   				      'Record has been deleted Successfully',
		   				      'success'
		   				    )*/
		   				    
		   				Swal.fire({
		   		            icon: 'success',
		   		            title:  'Mapping has been deleted Successfully'
		   		            });
		   				 
					  }/*else {
						  Swal.fire(
								  'Cancelled',
							      'Your Record is safe',
							      'error'
			   				    )
					  }*/
				  });
			
		}
	}

});