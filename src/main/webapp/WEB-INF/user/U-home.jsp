
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Online Room Service</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />

    <!-- Fonts and icons -->
    <script src="../assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: { families: ["Lato:300,400,700,900"] },
            custom: {
                families: [
                    "Flaticon", "Font Awesome 5 Solid",
                    "Font Awesome 5 Regular", "Font Awesome 5 Brands",
                    "simple-line-icons"
                ],
                urls: ['../assets/css/fonts.min.css']
            },
            active: function () {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!-- Bootstrap and CSS -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/atlantis.css">
    <link rel="stylesheet" href="../assets/css/custom.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    
</head>

<body>
    <div class="wrapper sidebar_minimize">
        <!-- Main Header -->
        <%@include file="/WEB-INF/user/U-header.jsp" %>

            <!-- Sidebar -->
            <%@include file="/WEB-INF/user/U-leftnavbar.jsp" %>

                <!-- Main Panel -->
                <div class="main-panel">
                    <div class="content">

                        <!-- Page Header -->
                        <div class="panel-header bg-dark">
                            <div class="page-inner py-3">
                                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                                    <div>
                                        <h2 class="text-white fw-bold">Online Room Service</h2>
                                    </div>
                                    <div class="ml-md-auto mb-4 py-2 py-md-0">
                                        <a href="/" class="btn btn-sm btn-border btn-light btn-round mr-2">
                                            <i class="fa fa-home"></i> Home
                                        </a>
                                        <a href="/user/home" id="dashboard1" class="btn btn-sm btn-border btn-light btn-round mr-2">
                                            <i class="fa fa-tachometer-alt"></i> Dashboard
                                        </a>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Page Content -->
                        <div class="page-inner">
                            <div class="row mt--2">
                                <div class="col-md-12">
                                    <div class="card full-height">
                                        <div class="card-header">
                                            <h4 class="card-title">
                                                <!-- heading -->
                                            </h4>
                                        </div>
                                        <div class="card-body">
                                            <!-- Content Goes Here -->
                                            <div class="modalSpace1">
                                                <div class="container mt-5">
                                                    <h2>Welcome, <span id="userNamePlaceholder">Guest</span></h2>

                                                
                                                    <div class="row">
                                                        <div class="col-md-6 bg-light p-4 rounded shadow-sm mb-4">
                                                            <h5><i class="fas fa-user icon-size"></i> Account Summary</h5>
                                                            
                                                            <p><strong>Name:</strong> <span id="userName">-</span></p>
                                                            <p><strong>User ID:</strong> <span id="userId">-</span></p>
                                                        </div>
                                                
                                                        <div class="col-md-6 bg-light p-4 rounded shadow-sm mb-4">
                                                            <h5><i class="fas fa-lightbulb"></i> Booking Tips</h5>
                                                            <ul>
                                                                <li>Book in advance for better availability!</li>
                                                                <li>Check out our special discounts for weekends.</li>
                                                                <li>Want a sea view? Click here to explore available rooms!</li>
                                                            </ul>
                                                        </div>
                                                        
                                                    </div>
                                                <div class="card-body text-center py-5">
                                                    <i class="fa fa-door-open fa-4x text-primary mb-4"></i>
                                                    <h4 class="font-weight-bold">Welcome to Online Room Service</h4>
                                                    <p class="text-muted">Use the "View Rooms" button to explore
                                                        available rooms and make your bookings faster.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Page Content End -->

                        

                    </div>
                </div>
    </div>

    <!-- Core JS Files -->
    <script src="../assets/js/core/jquery-3.5.1.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
    <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script src="../assets/js/atlantis.min.js"></script>

    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

    <!-- Custom JS -->
    <script src="../assets/coustomjs/manageData.js"></script>
    <script src="../assets/coustomjs/viewRooms.js"></script>
    <script src="../assets/coustomjs/manageBooking.js"></script>
    <script src="../assets/coustomjs/editProfile.js"></script>

    <!-- Logout Function -->
    <script>
        function logoutAndRedirect() {
            window.location.href = '/user/logout';
        }

        $(document).ready(function () {
    const userName = localStorage.getItem("userName");
    const userId = localStorage.getItem("userId");

    if (userName) {
        $("#userName").text(userName);
        $("#welcomeText").text("Welcome, " + userName);  // Optional
    }

    if (userId) {
        $("#userId").text(userId);
    }
});



    </script>
</body>

</html>