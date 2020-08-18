appControl.controller('deviceVehicleManagementCtrl', function($scope,
		$http, $compile, $filter, $location, $window) {
	
	$("#deviceVehicleMapping").click(function(){
		 
		 var deviceImei = $('#deviceImei').val();
		 var vehicleNo = $('#vehicleNo').val().toUpperCase();
		 var deviceId;
		 var vehicleId;
		 
		 if(deviceImei == '' || deviceImei == ' ' || deviceImei.length < 15 || deviceImei.length > 15 || isNaN(deviceImei)){
			 $("#deviceImei").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter 15 digits of Device Imei No</b>'
				    	})
		 }else if(vehicleNo == '' || vehicleNo == ' '){
			 $("#vehicleNo").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Vehicle No</b>'
				    	})
		}else{
			
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
			
			$scope.callVehicleDeviceMappingUrl = function(deviceId, vehicleId){
			
			$.ajax({
	            url : restUrl+'/api/v1/createVehicleDeviceMapping',
	            type: "POST",
	            data: JSON.stringify({
	            	"vehicleId": vehicleId,
	            	"deviceId": deviceId,
	            	"loginId":$scope.loginId
	            }),
	            contentType: "application/json; charset=utf-8",
	            dataType   : "json",
	            success : function(result) {
	                console.log(result);
	   			 $(document).Toasts('create', {
						class: 'bg-success', 
					    title: 'Success',
					    autohide: true,
					    delay: 5000,
					    icon: 'fa fa-check',
					    body: '<b>Device is Mapped with Vehicle Successfully</b>'
					    	})
					    	
					window.location.href = "/#/devicevehiclemanagementdetails";					    	
//					location.reload();
	   			 
	            },error: function(result){
	            	console.log(result);
	                var errorMessage = ' '+result.status + ' : ' + result.statusText;
				 $(document).Toasts('create', {
						 class: 'bg-maroon',
						 title: 'Error',
						 autohide: false,
						 subtitle: errorMessage,
						 delay: 5000,
						 icon: 'fa fa-exclamation-circle',
						 body: '<b>'+result.responseJSON.message+'</b>'
				 })
	            }
	        });
			}
		 }
		
	 });

});