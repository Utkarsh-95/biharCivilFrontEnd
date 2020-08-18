<div class="content-wrapper">
	<!-- Main content -->

	<section class="content">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">Vehicle Management</h5>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"></button>
								<div class="btn-group" ng-if="roles == 'ADMIN'">
									<a href="#/admin/addvehicle" class="small-box-footer">Add
										New Vehicle <i class="fas fa-arrow-circle-down"></i>
									</a>
								</div>
								<div class="btn-group">
									<a href="#/dashboard" class="small-box-footer">Back to
										Dashboard <i class="fas fa-arrow-circle-left"></i>
									</a>
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
									<button type="button" class="btn btn-tool"
										data-card-widget="maximize">
										<i class="fas fa-expand"></i>
									</button>
								</div>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="vehicleManagement"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Sr.No.</th>
										<th>Vehicle Id</th>
										<th>Vehicle No</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="x in responseDataVehicle.data">
										<td>{{$index+1}}</td>
										<td>{{x.vehicleId}}</td>
										<td>{{x.vehicleNo}}</td>
										<td><button type="button"
												ng-click="deleteVehicle(x.vehicleNo)" class="btn btn-danger"
												id="deleteVehicle">Delete</button></td>
									</tr>
								</tbody>
							</table>
							<!-- /.card-body -->
						</div>
						<!-- /.row -->
					</div>
					<!-- ./card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col -->
		</div>
	</section>
</div>