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
					<div class="card-body table-responsive">
						<table id="userManagementView"
							class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Sr.No.</th>
									<th>Role Type</th>
									<th>Login Name</th>
									<th>Username</th>
									<th>Password</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="x in responseDataLogins.data">
									<td>{{$index+1}}</td>
									<td>{{x.role}}</td>
									<td>{{x.loginname}}</td>
									<td>{{x.username}}</td>
									<td>{{x.password}}</td>
									<td><button ng-disabled="userName == '{{x.loginname}}'" type="button" ng-click="deleteUser(x.id, x.loginname)"
											class="btn btn-danger" id="deleteUser">
											Delete</button></td>
								</tr>
							</tbody>
						</table>

					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col -->
		</div>
	</section>
</div>