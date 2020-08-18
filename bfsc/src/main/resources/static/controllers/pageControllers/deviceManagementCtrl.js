appControl.controller('deviceManagementCtrl', function($scope, $http,
		$compile, $filter, $location, $window) {
		
	$http.get(restUrl+'/api/v1/findAllDeviceMasterData').success(
			function(response, status, headers, config) {
				$scope.responseDataDevice = response;
				$(function() {
					$('#deviceManagement').DataTable({
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
	
	$scope.deleteDevice = function (deviceImei) {
		
		$http.get(restUrl+'/api/v1/vehiceJoinDevice/'+deviceImei).success(
				function(response, status, headers, config) {
//					$scope.responseData = response;
					
					if(response.dataCount >= 1){
						$(document).Toasts('create', {
						    class: 'bg-maroon',
							title: 'Information',
						    autohide: true,
						    delay: 10000,
						    icon: 'fa fa-exclamation-circle',
						    body: '<b>This Imei No is Mapped with Vehicle Kindly Unmapped and then Remove it.</b>'
						    	})
					}else{
						
						Swal.fire({
							  title: 'Are you sure?',
							  text: "This Device will be deleted : - " + deviceImei,
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: 'Yes, delete it!'
					      }).then((result) => {
							  if (result.value) {
								  				  
								  $http.post(restUrl+'/api/v1/removeDeviceImei/'+deviceImei)
							        .success(function (response) {
//							            console.log(response);
							        	$http.get(restUrl+'/api/v1/findAllDeviceMasterData').success(
							        			function(response, status, headers, config) {
							        				$scope.responseDataDevice = response;
							        				$('#deviceManagement').DataTable().destroy();
							        				$(function() {
							        					$('#deviceManagement').DataTable({
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
					   				 
								  }
							  });
						
					}
					
					console.log(response);
				}).error(function(data, status, headers, config) {
			console.log('error: data = ', response);
		});
	}

});
