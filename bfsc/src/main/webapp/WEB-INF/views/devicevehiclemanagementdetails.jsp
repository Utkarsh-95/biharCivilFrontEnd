<div class="content-wrapper">
	<!-- Main content -->

	<section class="content">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">Device Vehicle Master</h5>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"></button>
								<div class="btn-group">
									<a href="#/devicevehiclemanagement" class="small-box-footer">Map
										Device with Vehicle <i class="fas fa-arrow-circle-down"></i>
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
							<table id="deviceVehicleManagement"
								class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Sr.No</th>
										<th>Vehicle No.</th>
										<th>Imei No.</th>
										<th>ICC ID</th>
										<th>Mobile No.1</th>
										<th>Mobile No.2</th>
										<th>Mapped DateTime</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="x in responseDataVehiceDevice.data">
										<td>{{$index+1}}</td>
										<td>{{x.vehicleNo}}</td>
										<td>{{x.deviceImei}}</td>
										<td>{{x.iccIc}}</td>
										<td>{{x.mobile_one}}</td>
										<td>{{x.mobile_two}}</td>
										<td>{{x.mappedDateTimestamp | date}}</td>
										<td><button type="button" ng-click="deleteVehicleDeviceMapping(x.vehicleNo, x.deviceImei)"
											class="btn btn-danger" id="deleteVehicleDeviceMapping">
											Delete</button></td>
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