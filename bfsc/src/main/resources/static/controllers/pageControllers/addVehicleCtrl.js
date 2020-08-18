appControl.controller('addVehicleCtrl', function($scope, $http, $compile, $filter, $location, $window, $rootScope) {
	
	$("#addVehicle").click(function(){
		 
		 var vehicleId = $('#vehicleId').val();
		 var vehicleNo = $('#vehicleNo').val().toUpperCase();
		 
		 if(vehicleId == '' || vehicleId == ' '){
			 $("#vehicleId").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Vehicle Id</b>'
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
			
			$.ajax({
	            url : restUrl+'/api/v1/saveVehicleMasterData',
	            type: "POST",
	            data: JSON.stringify({
	            	"vehicleId": vehicleId,
	            	"vehicleNo": vehicleNo,
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
					    body: '<b>Vehicle is added Successfully</b>'
					    	})
					    	
				window.location.href = "/#/vehiclemanagement";
//	   			location.reload();
	   			 
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
		
	 });
});