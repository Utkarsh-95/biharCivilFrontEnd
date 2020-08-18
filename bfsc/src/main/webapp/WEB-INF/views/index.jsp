<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bfsc.model.Config"%>
<html ng-app="appControl">
<head>
<title>Bihar State Food and Civil Supplies Corporation</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="shortcut icon" type="image/png" href="resources/dist/img/logo.png"/>

<!-- overlayScrollbars -->
<link rel="stylesheet" href="resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="resources/dist/css/ionicons.min.css">

<!-- daterange picker -->
<link rel="stylesheet" href="resources/plugins/daterangepicker/daterangepicker.css">

<!-- bootstrap datepicker -->
<link rel="stylesheet" href="resources/plugins/datepicker/css/bootstrap-datepicker.min.css">

<!-- Angular JS -->
<script type="text/javascript" src="resources/angularjs/angular.min.js"></script>
<script type="text/javascript" src="resources/angularjs/angular-route.min.js"></script>
<script type="text/javascript" src="resources/angularjs/dirPagination.js"></script>

<!-- DataTables -->
<link rel="stylesheet" href="resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="resources/plugins/datatables-bs4/custom/buttons.dataTables.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
<link rel="stylesheet" href="resources/dist/css/custom.css" />
<link rel="stylesheet" href="resources/dist/css/spinkit.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<!-- SweetAlert2 -->
<link rel="stylesheet" href="resources/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

<!-- HighCharts -->
<link rel="stylesheet" href="/resources/plugins/highcharts/highcharts.css" />
<script src="resources/plugins/highcharts/highcharts.js"></script>
<script src="resources/plugins/highcharts/exporting.js"></script>
<script src="resources/plugins/highcharts/export-data.js"></script>
<script src="resources/plugins/highcharts/accessibility.js"></script>
</head>

<script>
	var username = "<%= Config.USERNAME %>";
	var role = "<%= Config.ROLE %>";
	var loginId = "<%= Config.LOGIN_ID %>";
	var restUrl = "<%= Config.REST_URL %>";
</script>

<body
	class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed"
	ng-controller="mainCtrl" onload="loadFunction()">
	<div id="load">

		<div class="sk-bounce">
			<div class="sk-bounce-dot"></div>
			<div class="sk-bounce-dot"></div>
		</div>

	</div>

	<div id="contents">
		<div class="wrapper">
			<!-- Navbar -->
			<nav
				class="main-header navbar navbar-expand navbar-white navbar-light">
				<!-- Left navbar links -->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						data-widget="pushmenu" href="resources/" role="button"><i
							class="fas fa-bars"></i></a></li>
					<%-- <li class="nav-item"><a class="nav-link">${_csrf.token}</a></li> --%>
					<!-- <li class="nav-item d-none d-sm-inline-block"><a
						href="resources/index3.html" class="nav-link">Home</a></li>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="resources/#" class="nav-link">Contact</a></li> -->
				</ul>

				<!-- SEARCH FORM -->
				<form class="form-inline ml-3" hidden>
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>

				<!-- Right navbar links -->
				<ul class="navbar-nav ml-auto" hidden>
					<!-- Notifications Dropdown Menu -->
					<li class="nav-item dropdown"><a class="nav-link"
						data-toggle="dropdown" href="#"> <i class="far fa-bell"
							style="font-size: 36px;"></i> <span
							class="badge badge-warning navbar-badge"
							style="font-weight: 1000; font-size: 15px;">15</span>
					</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
							<span class="dropdown-item dropdown-header">15 Alert
								Notifications</span>
							<div class="dropdown-divider"></div>
							<a href="" class="dropdown-item"> <i
								class="fas fa-envelope mr-2"></i> 15 new alert notifications
							</a>
							<div class="dropdown-divider"></div>
							<a href="#/alertnotify" class="dropdown-item dropdown-footer">See
								All Notifications</a>
						</div></li>
				</ul>

				<ul class="navbar-nav ml-auto">
					<li class="dropdown user user-menu"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><i class="far fa-bell"
							style="color: red; font-size: 24px;"></i> <span
							class="badge badge-danger navbar-badge"
							style="font-weight: 1000; font-size: 14px;">15</span> </a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
							<span class="dropdown-item dropdown-header">15 Alert
								Notifications</span>
							<div class="dropdown-divider"></div>
							<a href="" class="dropdown-item"> <i
								class="fas fa-envelope mr-2"></i> 15 new alert notifications
							</a>
							<div class="dropdown-divider"></div>
							<a href="#/alertnotify" class="dropdown-item dropdown-footer">See
								All Notifications</a>
						</div></li>
					
					<li class="dropdown user user-menu">&nbsp;&nbsp;&nbsp;<a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-user" style="font-size: 20px;"></i><!-- fas fa-cog fa-spin -->
						<!-- fa-spin --> <span class="hidden-xs">&nbsp;<%= Config.USERNAME %></span>
					</a>
						<ul class="dropdown-menu" style="width: 100px;">
							<!-- Menu Body -->
							<li class="user-body">
								<div class="row">
									<div class="col-md-12 text-center">
										<div class="pull-left" hidden>
											<a type="button" href="#/recoverpasswords"
												class="btn btn-primary">Change Password</a>
										</div>
										<div class="dropdown-divider" hidden></div>
										<div class="pull-left">
											<form action="logout" method="post">
												<input class="btn btn-primary" type="submit"
													value="Sign out" /> <input type="hidden"
													name="${_csrf.parameterName}" value="${_csrf.token}" />
											</form>
											<!-- <a href="/logout" class="btn btn-default">Sign out</a> -->
										</div>
									</div>
								</div> <!-- /.row -->
							</li>
						</ul></li>
				</ul>

			</nav>
			<!-- /.navbar -->

			<!-- Main Sidebar Container -->
			<aside class="main-sidebar sidebar-dark-primary elevation-4">
				<!-- Brand Logo -->
				<a href="" class="brand-link"> <img
					src="resources/dist/img/logo.png" alt="BFSC Logo"
					class="brand-image"
					style="width: fit-content; max-height: 50px; margin-left: 25px">
				</a>

				<!-- Sidebar sidebar-->
				<div class="">
					<div class="user-panel mt-3 pb-3 mb-3 d-flex">
						<div class="info">
							<a href="" class="d-block">BFSC Console Admin Login</a>
						</div>
					</div>

					<!-- Sidebar Menu -->
					<nav class="mt-2">
						<ul class="nav nav-pills nav-sidebar flex-column"
							data-widget="treeview" role="menu" data-accordion="true">

							<li class="nav-item" style="color: white;"><a
								href="#/dashboard" class="nav-link"> <i
									class="nav-icon fas fa-tachometer-alt"></i>
									<p>
										Dashboard <span class="right badge badge-danger">HomePage</span>
									</p>
							</a></li>

							<li class="nav-item has-treeview"><a href=""
								class="nav-link"> <i class="nav-icon fas fa-shopping-cart"></i>
									<p>
										Inventory <i class="right fas fa-angle-left"></i>
									</p>
							</a>
								<ul class="nav nav-treeview">
									<li class="nav-item"><a href="#/devicemanagement"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>Device Management</p>
									</a></li>
									<li class="nav-item"><a href="#/vehiclemanagement"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>Vehicle Management</p>
									</a></li>
									<li class="nav-item"><a
										href="#/devicevehiclemanagementdetails" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Device Vehicle Master</p>
									</a></li>
								</ul></li>

							<li class="nav-item has-treeview" ng-if="roles == 'ADMIN'"><a href=""
								class="nav-link"> <i class="nav-icon fas fa-user"></i>
									<p>
										User Management<i class="right fas fa-angle-left"></i>
									</p>
							</a>
								<ul class="nav nav-treeview">
									<li class="nav-item"><a href="#/admin/usermanagement"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>Add User </p>
									</a></li>
									<li class="nav-item"><a href="#/admin/usermanagementview"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>View User</p>
									</a></li>
									<li class="nav-item" hidden><a href="#/dashboard"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>v3</p>
									</a></li>
								</ul></li>

							<li class="nav-item has-treeview" hidden><a href=""
								class="nav-link"> <i class="nav-icon fas fa-th"></i>
									<p>
										Reports <i class="right fas fa-angle-left"></i>
									</p>
							</a>
								<ul class="nav nav-treeview">
									<li class="nav-item"><a href="#/dashboard"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>v1</p>
									</a></li>
									<li class="nav-item"><a href="#/dashboard"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>v2</p>
									</a></li>
									<li class="nav-item"><a href="#/dashboard"
										class="nav-link"> <i class="far fa-circle nav-icon"></i>
											<p>v3</p>
									</a></li>
								</ul></li>

							<!-- <li class="nav-header"></li>
							<li class="nav-item"><a href="" class="nav-link">
									<i class="nav-icon far fa-circle text-danger"></i>
									<p class="text">Important</p>
							</a></li>
							<li class="nav-item"><a href="" class="nav-link">
									<i class="nav-icon far fa-circle text-warning"></i>
									<p>Warning</p>
							</a></li>
							<li class="nav-item"><a href="" class="nav-link">
									<i class="nav-icon far fa-circle text-info"></i>
									<p>Informational</p>
							</a></li> -->
						</ul>
					</nav>
					<!-- /.sidebar-menu -->
				</div>
			</aside>

			<!-- Ng-view -->
			<ng-view></ng-view>

			<!-- Main Footer -->
			<footer class="main-footer">
				<strong style="color: black;">Designed And Developed By
					Rosmerta Technologies Ltd.</strong>
				<div class="float-right d-sm-inline-block">
					<b style="color: black;">&copy; 2020. All Rights Reserved.</b>
				</div>
			</footer>
		</div>
		<!-- ./wrapper -->
	</div>
	<!-- ./contents -->

	<!-- REQUIRED SCRIPTS -->
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" charset="utf8" src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-bs4/custom/dataTables.buttons.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-bs4/custom/jszip.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-bs4/custom/pdfmake.min.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-bs4/custom/vfs_fonts.js"></script>
	<script type="text/javascript" charset="utf8" src="resources/plugins/datatables-bs4/custom/buttons.html5.min.js"></script>
	
	<!-- overlayScrollbars -->
	<script src="resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- InputMask -->
	<script src="resources/plugins/moment/moment.min.js"></script>
	<script src="resources/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
	<!-- bootstrap datepicker -->
	<script src="resources/plugins/datepicker/js/bootstrap-datepicker.min.js"></script>
	<!-- date-range-picker -->
	<script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/dist/js/adminlte.js"></script>
	<!-- OPTIONAL SCRIPTS -->
	<script src="resources/dist/js/demo.js"></script>
	<!-- SweetAlert2 -->
	<script src="resources/plugins/sweetalert2/sweetalert2.min.js"></script>
	
	<!--Page Controllers-->
	<script src="resources/controllers/ControlPanelApp.js"></script>
	<script src="resources/controllers/AppControllers.js"></script>

	<script src="resources/controllers/pageControllers/deviceManagementCtrl.js"></script>
	<script src="resources/controllers/pageControllers/vehicleManagementCtrl.js"></script>	
	<script src="resources/controllers/pageControllers/addDeviceCtrl.js"></script>
	<script src="resources/controllers/pageControllers/addVehicleCtrl.js"></script>

	<script src="resources/controllers/pageControllers/deviceVehicleManagementCtrl.js"></script>
	<script src="resources/controllers/pageControllers/deviceVehicleManagementDetailsCtrl.js"></script>
	<script src="resources/controllers/pageControllers/alertNotifyCtrl.js"></script>
	<script src="resources/controllers/pageControllers/userManagementCtrl.js"></script>
	<script src="resources/controllers/pageControllers/userManagementViewCtrl.js"></script>
	
	<script>
	
	/* function spacenotallowed(event){
		var key = event.keyCode;
		return (key != 32);
	}
	
	function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : evt.keyCode
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	}
	
	function alphaOnly(event) {
		  var key = event.keyCode;
		  return ((key >= 65 && key <= 90) || key == 8 || key == 32 || (key >= 97 && key <= 122));
	} */
			
	function loadFunction() {
		var myVar = setTimeout(showPage, 1000);
		}
	
	function showPage() {
		document.getElementById("load").style.display = "none";
		document.getElementById("contents").style.display = "block";
		}
	</script>
</body>
</html>