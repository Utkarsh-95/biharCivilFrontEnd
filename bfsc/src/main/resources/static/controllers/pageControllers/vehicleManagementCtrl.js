appControl.controller('vehicleManagementCtrl', function($scope, $http,
		$compile, $filter, $location, $window, $rootScope) {

	$http.get(restUrl+'/api/v1/findAllVehicleMasterData').success(
			function(response, status, headers, config) {
				$scope.responseDataVehicle = response;
				$(function() {
					$('#vehicleManagement').DataTable({
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
	
	$scope.deleteVehicle = function (vehicleNo) {
		
		$http.get(restUrl+'/api/v1/vehiceJoinDevice/'+vehicleNo).success(
				function(response, status, headers, config) {
//					$scope.responseData = response;
					
					if(response.dataCount >= 1){
						$(document).Toasts('create', {
						    class: 'bg-maroon',
							title: 'Information',
						    autohide: true,
						    delay: 10000,
						    icon: 'fa fa-exclamation-circle',
						    body: '<b>This Vehicle No is Mapped with Device Kindly Unmapped and then Remove it.</b>'
						    	})
					}else{
						
						Swal.fire({
							  title: 'Are you sure?',
							  text: "This Device will be deleted : - " + vehicleNo,
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: 'Yes, delete it!'
					      }).then((result) => {
							  if (result.value) {
								  				  
								  $http.post(restUrl+'/api/v1/removeVehicleNo/'+vehicleNo)
							        .success(function (response) {
//							            console.log(response);
							        	$http.get(restUrl+'/api/v1/findAllVehicleMasterData').success(
							        			function(response, status, headers, config) {
							        				$scope.responseDataVehicle = response;
							        				$('#vehicleManagement').DataTable().destroy();
							        				$(function() {
							        					$('#vehicleManagement').DataTable({
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
								  
					   				Swal.fire({
					   		            icon: 'success',
					   		            title:  'Device has been deleted Successfully'
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
					
					console.log(response);
				}).error(function(data, status, headers, config) {
			console.log('error: data = ', response);
		});
	}

});