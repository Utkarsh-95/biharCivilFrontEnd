<div class="hold-transition login-page">
	<div class="login-box">
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">You are only one step a way from your
					new password, change your password now.</p>
				<p class="login-box-msg" hidden>${_csrf.token}</p>

				<form>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control"
							placeholder="Confirm Password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-block">Change
								password</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->
</div>