<div class="content-wrapper">
	<!-- Main content -->

	<section class="content">
		<div class="container-fluid">

			<div class="col-md-12">
				<!-- general form elements disabled -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Add New Vehicle</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool"></button>
							<div class="btn-group">
								<a href="#/vehiclemanagement" class="small-box-footer">Back
									to Vehicle Management <i class="fas fa-arrow-circle-left"></i>
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
									<!-- text input -->
									<div class="form-group">
										<label>Vehicle Id</label> <input type="text"
											class="form-control" id="vehicleId" name="vehicleId"
											placeholder="Enter Vehicle ID">
									</div>
								</div>
								<div class="col-sm-6">
									<!-- text input -->
									<div class="form-group">
										<label>Vehicle No</label> <input type="text"
											class="form-control" id="vehicleNo" name="vehicleNo"
											placeholder="Vehicle No">
									</div>
								</div>
							</div>
							<div class="row" hidden>
								<div class="col-sm-6">
									<!-- text input -->
									<div class="form-group">
										<label>Chasis No.</label> <input type="text"
											class="form-control" id="chasisNo" name="chasisNo"
											placeholder="Enter Chasis No.">
									</div>
								</div>
								<div class="col-sm-3">
									<!-- text input -->
									<div class="form-group">
										<label>Vehicle Color</label> <input type="text"
											class="form-control" id="vehicleColor" name="vehicleColor"
											placeholder="Enter Vehicle Color">
									</div>
								</div>
								<div class="col-sm-3">
									<!-- text input -->
									<div class="form-group">
										<label>Model Type</label> <input type="text"
											class="form-control" id="modelType" name="modelType"
											placeholder="Enter Model Type">
									</div>
								</div>
							</div>
							<div class="row" hidden>
								<div class="col-sm-6">
									<!-- text input -->
									<div class="form-group">
										<label>text</label> <input type="text" class="form-control"
											id="" name="" placeholder="Enter ...">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-primary" id="addVehicle">Submit</button>
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