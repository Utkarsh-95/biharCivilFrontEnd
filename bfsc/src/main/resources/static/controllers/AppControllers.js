appControl.controller('mainCtrl', function($scope, $http, $compile, $filter, $location, $window, $rootScope) {
	
	$scope.doTheBack = function() {
		  window.history.back();
		};
		
	$scope.roles = role;
	$scope.loginId = loginId;
	$scope.userName = username;
	   
	   if ($scope.roles == 'ADMIN') {
		   $location.path('dashboard');
		} else if($scope.roles=='USER'){
			$location.path('dashboard');
		} else {
			$location.path('dashboard');
		}

});

appControl.controller('dashboardCtrl', function($scope, $http, $compile, $filter, $location, $window, $rootScope) {
	
//	var self = this;
//    var curDate = new Date();
//    self.maximumDate = new Date();
    
    $('#datepicker').datepicker({
		format : "yyyy-mm-dd",
		startDate : '-180d',
		endDate : '+0d',
		autoclose : true
	})	
	$('#datepicker').datepicker('setDate', '+0d');
	
	$("#showchart").click(function(){
		
		var imeino = $('#imeino').val();
		var date = $('#datepicker').val();
		
		if(imeino == ''|| imeino == ' '){
			$("#imeino").focus();
			$('#container').hide();
			$(document).Toasts('create', {
				class: 'bg-warning', 
			    title: 'Warning',
			    autohide: true,
			    delay: 5000,
			    icon: 'fa fa-exclamation-circle',
			    body: '<b>Please Enter Imei No</b>'
			    	})
		} 
		
		else if(date == ''|| date == ' '){
			$("#datepicker").focus();
			$('#container').hide();
			$(document).Toasts('create', {
				class: 'bg-warning', 
			    title: 'Warning',
			    autohide: true,
			    delay: 5000,
			    icon: 'fa fa-exclamation-circle',
			    body: '<b>Please fill out the focussed field to Submit</b>'
			    	})
		} else {
	        $.ajax({
	            url : "http://103.197.121.106/bihar-civil-webservice-voltage/api/v1/getWeightVoltageData ",
//	            url : "http://192.191.190.17/bihar-civil-webservice/api/v1/getWeightVoltageData ",
	            type: "POST",
	            data: JSON.stringify({
	            	"imei": imeino,
	            	"vehicleNo": null,
	            	"fromDate": null,
	            	"toDate": date
	            }),
	            contentType: "application/json; charset=utf-8",
	            dataType   : "json",
	            success : function(result) {
	            	$('#container').show();
	            	var imei;
	            	var date;
	                var timearr;
	                var countDtls;
	                console.log(result);
	                result.forEach(
	                        function(data) {
	                        	
	                        	drawChart(data);
	                        	
	                        	imei=data.name;
	                        	date=data.date;
	                        	timearr=data.time;
	                        	countDtls=data.data
	                        	console.log(data.data);
	                        });
	            },error: function(xhr, status, error){
	            	$('#container').hide();
	                var errorMessage = xhr.status + ': ' + xhr.statusText;
	                $(document).Toasts('create', {
	    				class: 'bg-maroon',
	    			    title: 'Error',
	    			    autohide: true,
	    			    subtitle: errorMessage,
	    			    delay: 5000,
	    			    icon: 'fa fa-exclamation-circle',
	    			    body: '<b>Entered Imei No. is not Valid</b>'
	    			    	})
	            }
	        });
		}
	        function drawChart(data) {
	             Highcharts.chart('container', {
	                chart : {
	                    type : 'spline',
	                    styledMode : true
	                },
	                title : {
	                    text : 'Voltage(weight) fluctuation day-wise '
	                },
	                xAxis : [ {
	                    title : {
	                        text : data.date
	                    },
	                    categories : data.time
	                } ],
	                yAxis : [ {
	                    className : 'highcharts-color-0',
	                    title : {
	                        text : 'Voltage'
	                    }
	                } ],
	                series : [ {
	                	name : data.imei,
	                    data : data.data
	                } ]
	            }); 
	            
	        }
		});
	
});

appControl.controller('dashblockCtrl', function($scope, $http, $compile, $filter, $location, $window, $rootScope) {

	$(function() {
		$('#dashblock1').DataTable({
//			"dom" : 'Bfrtip',
//			"dom" : 'Blfrtip',
			"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
			"dom" : '<"float-left"B><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
			"buttons" : [ 'copy', 'excel', 'pdf' ],
			"responsive" : true,
			"autoWidth" : false

		});
	});
	
	$(function() {
		$('#dashblock2').DataTable({
//			"dom" : 'Bfrtip',
//			"dom" : 'Blfrtip',
			"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
			"dom" : '<"float-left"B><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
			"buttons" : [ 'copy', 'excel', 'pdf' ],
			"responsive" : true,
			"autoWidth" : false

		});
	});
	
	$(function() {
		$('#dashblock3').DataTable({
//			"dom" : 'Bfrtip',
//			"dom" : 'Blfrtip',
			"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
			"dom" : '<"float-left"B><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
			"buttons" : [ 'copy', 'excel', 'pdf' ],
			"responsive" : true,
			"autoWidth" : false

		});
	});
	
	$(function() {
		$('#dashblock4').DataTable({
//			"dom" : 'Bfrtip',
//			"dom" : 'Blfrtip',
			"lengthMenu" : [[8, 10, 20, -1], [8, 10, 20, 'All']],
			"dom" : '<"float-left"B><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
			"buttons" : [ 'copy', 'excel', 'pdf' ],
			"responsive" : true,
			"autoWidth" : false

		});
	});

});