appControl.controller('addDeviceCtrl', function($scope, $http, $compile, $filter, $location, $window) {
	    	
	 $("#addDevice").click(function(){
		 
		 var deviceId = $('#deviceId').val();
		 var imeiNo = $('#imeiNo').val();
		 var iccId = $('#iccId').val();
		 var mob1 = $('#mob1').val();
		 var mob2 = $('#mob2').val();
		 
		 if(deviceId == '' || deviceId == ' '){
			 $("#deviceId").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Device Id</b>'
				    	})
		 }else if(imeiNo == '' || imeiNo == ' ' || imeiNo.length < 15 || imeiNo.length > 15 || isNaN(imeiNo)){
			 $("#imeiNo").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter 15 digits Imei No.</b>'
				    	})				    	
		 }else if(iccId == '' || iccId == ' '){
			 $("#iccId").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Icc ID</b>'
				    	})				    	
		 }else if(mob1 == '' || mob1 == ' ' || mob1.length < 15 || mob1.length > 15 || isNaN(mob1)){
			 $("#mob1").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter 15 digits Mobile No.1 without +91 or 0 Code</b>'
				    	})				    	
		 }else if(mob2 == '' || mob2 == ' ' || mob2.length < 15 || mob2.length > 15 || isNaN(mob2)){
			 $("#mob2").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter 15 digits Mobile No.2 without +91 or 0 Code</b>'
				    	})
		}else{
			
			$.ajax({
	            url : restUrl+'/api/v1/saveDeviceMasterData',
	            type: "POST",
	            data: JSON.stringify({
	            	"deviceId": deviceId,
	            	"deviceImei": imeiNo,
	            	"iccId": iccId,
	            	"mobile_one": mob1,
	            	"mobile_two": mob2,
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
					    body: '<b>Device is added Successfully</b>'
					    	})
					    	
					window.location.href = "/#/devicemanagement";				    	
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
		
	 });
});