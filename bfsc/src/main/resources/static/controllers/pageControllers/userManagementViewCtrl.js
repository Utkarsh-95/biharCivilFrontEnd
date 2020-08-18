appControl.controller('userManagementViewCtrl', function($scope, $http,
		$compile, $filter, $location, $window, $rootScope) {
	
	$http.get(restUrl+'/api/v1/findAllUserMasterData').success(
		function(response, status, headers, config) {
			$scope.responseDataLogins = response;
			$(function() {
				$('#userManagementView').DataTable({
					"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
		// "buttons" : [ 'copy', 'excel', 'pdf' ],
					"responsive" : true,
					"autoWidth" : false

				});
			});
			console.log(response);
		}).error(function(data, status, headers, config) {
	console.log('error: data = ', response);
	});

	$scope.deleteUser = function (index, loginname) {

		  Swal.fire({
			  title: 'Are you sure?',
			  text: "This User will be deleted : - " + loginname,
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
	      }).then((result) => {
			  if (result.value) {
				  				  
				  $http.post(restUrl+'/api/v1/deleteUserMasterData', {id: index}, {headers: {'Content-Type': 'application/json'} })
			        .then(function (response) {
//			            console.log(response);
			            $http.get(restUrl+'/api/v1/findAllUserMasterData').success(
			    				function(response, status, headers, config) {
			    					$scope.responseDataLogins = response;
		    						$('#userManagementView').DataTable().destroy();			    					
			    					$(function() {
			    						$('#userManagementView').DataTable({
			    							"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
			    				// "buttons" : [ 'copy', 'excel', 'pdf' ],
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
	   		            title:  'User has been deleted Successfully'
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

});
