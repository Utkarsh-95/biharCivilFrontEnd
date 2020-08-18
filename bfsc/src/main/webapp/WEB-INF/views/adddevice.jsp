<div class="content-wrapper">
	<!-- Main content -->

	<section class="content">
		<div class="container-fluid">

			<div class="col-md-12">
				<!-- general form elements disabled -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Add New Device</h3>
						<div class="card-tools">
							<button type="button" class="btn btn-tool"></button>
							<div class="btn-group">
								<a href="#/devicemanagement" class="small-box-footer">Back
									to Device Management <i class="fas fa-arrow-circle-left"></i>
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
										<label>Device Id</label> <input type="text"
											class="form-control" id="deviceId" name="deviceId"
											placeholder="Enter Device ID">
									</div>
								</div>
								<div class="col-sm-6">
									<!-- text input -->
									<div class="form-group">
										<label>Imei No</label> <input type="text" class="form-control"
											id="imeiNo" name="imeiNo" placeholder="Enter IMEI NO">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<!-- text input -->
									<div class="form-group">
										<label>ICCID</label> <input type="text" class="form-control"
											id="iccId" name="iccId" placeholder="Enter ICCID">
									</div>
								</div>
								<div class="col-sm-3">
									<!-- text input -->
									<div class="form-group">
										<label>Mobile No. 1</label> <input type="text"
											class="form-control" id="mob1" name="mob1"
											placeholder="Enter Mobile No. 1">
									</div>
								</div>
								<div class="col-sm-3">
									<!-- text input -->
									<div class="form-group">
										<label>Mobile No. 2</label> <input type="text"
											class="form-control" id="mob2" name="mob2"
											placeholder="Enter Mobile No. 2">
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
									<button type="submit" class="btn btn-primary" id="addDevice">Submit</button>
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