appControl.controller('userManagementCtrl', function($scope, $http,
		$compile, $filter, $location, $window, $rootScope) {
	
	$scope.multipleRoles = [
	    {role : 'ADMIN'},
	    {role : 'USER'}
	  ];
	
	$("#addUser").click(function(){
		 
		 var roleType = $('#roleType').val();
		 var loginName = $('#loginName').val();
		 var userName = $('#userName').val();
		 var password = $('#password').val();
		 
		 if(roleType == ''){
			 $("#roleType").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Select Role Type of User</b>'
				    	})
		}else if(loginName == '' || loginName == ' '){
			 $("#loginName").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Login Name</b>'
				    	})
		 }else if(userName == '' || userName == ' '){
			 $("#userName").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Username</b>'
				    	})
		 }else if(password == '' || password == ' '){
			 $("#password").focus();
			 $(document).Toasts('create', {
					class: 'bg-warning', 
				    title: 'Warning',
				    autohide: true,
				    delay: 5000,
				    icon: 'fa fa-exclamation-circle',
				    body: '<b>Please Enter Password</b>'
				    	})
		 }else{
			
			$.ajax({
	            url : restUrl+'/api/v1/saveUserMasterData',
	            type: "POST",
	            data: JSON.stringify({
	            	"username": userName,
	            	"password": password,
	            	"role": roleType,
	            	"loginname": loginName
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
					    body: '<b>User Created Successfully, Now you can Login.</b>'
					    	})
					    	
				window.location.href = "/#/admin/usermanagementview";
//	   			location.reload();
	   			 
	            },error: function(result){
	            	console.log(result);
	                var errorMessage = result.status + ' : ' + result.statusText;
					 $(document).Toasts('create', {
							 class: 'bg-maroon',
							 title: 'Error',
							 autohide: true,
							 subtitle: errorMessage,
							 delay: 5000,
							 icon: 'fa fa-exclamation-circle',
							 body: '<b>Error in Creating new User '+ result.responseJSON.message +'</b>'
					 })
	            }
	        });
		 }
		
	 });

});