<div class="content-wrapper">
	<!-- Main content -->

	<section class="content">
		<div class="container-fluid">

			<div class="col-md-12">
				<!-- general form elements disabled -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">User Management</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool"></button>
							<div class="btn-group">
								<a href="#/dashboard" class="small-box-footer">Back to
									Dashboard <i class="fas fa-arrow-circle-left"></i>
								</a>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<form role="form">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Role Type</label>
										<!-- <datalist id="loginRoles">
											<option ng-repeat="x in multipleRoles"
											value="{{x.role}}"></option>
										</datalist>
										<input type="text" class="form-control clearable"
											list="loginRoles" id="loginRoles"
											placeholder="Select Role Type for Login"> -->

										<select class="form-control" id="roleType">
											<option value="">Select Role Type for Login</option>
											<option value="ADMIN">ADMIN</option>
											<option value="USER">USER</option>
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Login Name </label> <input type="text" id="loginName"
											class="form-control" placeholder="Enter Login Name">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Username </label> <input type="text" id="userName"
											class="form-control" placeholder="Enter Username">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Password </label> <input type="text" id="password"
											class="form-control" placeholder="Enter Password">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-primary" id="addUser">Submit</button>
								</div>
							</div>
						</form>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col -->
		</div>
	</section>
</div>