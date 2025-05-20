<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Online Room service</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!-- Fonts and icons -->
<script src="../assets/js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '../assets/css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
</script>
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/atlantis.css">
<link rel="stylesheet" href="../assets/css/custom.css">
<script src="../assets/js/core/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
</head>
<body>
	<div class="wrapper sidebar_minimize">
		<!-- Main header start -->
		<%@include file="/WEB-INF/commons/header.jsp"%>
		<!-- Main header end -->
		<!-- Sidebar -->
		<%@include file="/WEB-INF/commons/leftnavbar.jsp"%>

		<div class="main-panel">

			<div class="content">
				<div class="panel-header bg-dark">
					<div class="page-inner py-3">
						<div
							class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2  id="manageDashboard" class="text-blue pb-2 fw-bold">ADMIN PANEL</h2>
							</div>
							<div class="ml-md-auto mb-4 py-2 py-md-0">
								<a href="" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i
									class="fa fa-home"></i></a> <a href="#"
									class="btn btn-sm btn-border btn-blue btn-round mr-2">/
									Dashboard</a>
							</div>
						</div>
					</div>
				</div>

				<div class="page-inner">
					<div class="row mt--2">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-header">
									<h4 class="card-title"></h4>
									<div class="card-body">
										<div class="modalSpace1">
											<%@include file="/WEB-INF/admin/dashboard.jsp"%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
</body>

<script src="../assets/coustomjs/manageUsers.js"></script>
<script src="../assets/coustomjs/manageData.js"></script>
<script src="../assets/coustomjs/manageRooms.js"></script>
<script src="../assets/coustomjs/manageUBooking.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap.min.js"></script>

<!-- jQuery UI -->
<script
	src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script
	src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script
	src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

<!-- Atlantis JS -->
<script src="../assets/js/atlantis.min.js"></script>

<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

   <script>
        function logoutAndRedirect() {

            
            // Perform logout actions here if needed
            
            // Redirect to homepage
            window.location.href = '/user/logout';

        }
    </script>

<!-- Data Table End-->
<!-- navbar -->
