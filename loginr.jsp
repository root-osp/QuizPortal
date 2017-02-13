<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Faculty Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/login.css">
   <script src="bootstrap/js/bootstrap.min.js"></script>
  <script src="js/login.js"></script>
  <script src="jquery/jquery-1.12.0.min.js"></script>
  <script type = "text/javascript" >
    history.pushState(null, null, 'FacultyLogin');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'FacultyLogin');
    });
    </script>
</head>
<body>
<legend align="center">JUET QUIZ PORTAL</legend><br>
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="login.jsp"   id="login-form-link">Student</a>
							</div>
							<div class="col-xs-6">
								<a href="#" class="active" id="register-form-link">Faculty</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="uslogger" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="usid" id="usid" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="pass" id="pass" tabindex="2" class="form-control" placeholder="Password">
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Login">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="adminlogger" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="usid" id="usid" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									
									<div class="form-group">
										<input type="password" name="pass" id="pass" tabindex="2" class="form-control" placeholder="Password">
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Login">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

