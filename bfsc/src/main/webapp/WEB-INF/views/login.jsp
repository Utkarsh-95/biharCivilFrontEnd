<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/png" href="resources/dist/img/logo.png"/>
<title>BFSC Login</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="resources/dist/css/ionicons.min.css">
<link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="resources/dist/js/aes.js"></script>
<script>
	function encrypt() {
		var pass = document.getElementById('passencrpytfield').value;
		var hide = document.getElementById('irrelevant').value;
		document.getElementById("irrelevant").value = document.getElementById("passencrpytfield").value;
		var hash = CryptoJS.MD5(pass);
		document.getElementById("passencrpytfield").value = hash;
		return true;
	}
</script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<img src="resources/dist/img/logo.png" alt="BFSC Logo"
				style="width: fit-content;"> <br>
			<!-- <b>Bihar State Food and Civil Supplies Corporation</b> -->
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<%-- <p class="login-box-msg">
					<c:if test="${param.error ne null}">
						<div class="alert alert-danger" style="text-align: center;">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
					</c:if>
				</p> --%>

				<p>
					<c:if test="${param.error != null}">
						<div class="alert alert-danger" style="text-align: center;">
							Bad Credentials</div>
					</c:if>
				</p>

				<c:if test="${param.logout != null}">
					<div class="alert alert-info" style="text-align: center;">
						You have been successfully logged out</div>
				</c:if>
				
				<!-- autocomplete="off" -->
				<form action="login" method="POST">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Enter your Username" name="username" required>
							<!-- <input type="text" class="form-control"
							placeholder="Enter your Username" name="username" required> -->
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<!-- <input autocomplete="off" type="password" class="form-control"
							placeholder="Enter your Password" name="password"> -->
						<input type="password" class="form-control"
							placeholder="Enter your Password" id="password"
							name="password" required> <!-- <input type="hidden"
							name="irrelevant" id="irrelevant" /> -->
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-block">Sign In</button>
							<!-- onclick="return encrypt()" -->
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
					</div>
				</form>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/dist/js/adminlte.min.js"></script>

</body>
</html>