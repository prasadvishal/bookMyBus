<Html>
	<title>BookMyBus</title>
	<head>
		<!-- Compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"></link>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></link>
    	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="resources/css/Basestyle.css"></link>
	</head>
	<body>
		<!-- Dropdown Structure Start -->
		<ul id="dropdown1" class="dropdown-content" style="margin-top:65px;">
		  <li><a href="#loginModal" class="waves-effect waves-light modal-trigger" >Login</a></li>
		  <li><a href="#signupModal" class="waves-effect waves-light modal-trigger" >Sign Up</a></li>
		  <li class="divider"></li>
		  <li><a href="#!">About</a></li>
		</ul>
		<!-- Dropdown Structure End -->

		<!-- Navbar Start -->
			<nav>
			  <div class="nav-wrapper red">
			    <a href="#!" class="brand-logo"><i class="fa fa-bus" aria-hidden="true" style="margin-left:10px;"></i>BookMyBus.com</a>
			    <ul class="right hide-on-med-and-down">
			      <!-- Dropdown Trigger -->
			      <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Options<i class="fa fa-caret-down" aria-hidden="true" style="margin-left:5px;"></i></a></li>
			    </ul>
			  </div>
			</nav>
		<!-- Navbar End -->

		<!-- Seat Availability Modal Div Start -->
		<div id="seatAvailabityModal">
		</div>
		<!-- Seat Availability Modal Div End -->

		<!-- Login Modal Start -->
        <div id="loginModal" class="modal bottom-sheet">
            <div class="modal-content">
                <div class="row">
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field row s6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="login_username" type="text" class="validate">
                                <label for="login_username">User Name</label>
                            </div>
                            <div class="input-field row s6">
                                <i class="material-icons prefix">lock</i>
                                <input id="login_password" type="password" class="validate">
                                <label for="login_password">Password</label>
                            </div>
                            <div class="input-field row s6">
                                <button class="btn red waves-effect waves-light" type="button" name="action" id="login_btn" onclick="javascript:loginAjax();">Submit
                                    <i class="material-icons right">send</i>
                                </button>
                                <a href="#!" class="waves-effect waves-red btn-flat" id="login_forgot_password_btn">Forgot Password?</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Login Modal End -->

        <!-- SignUp Modal Start -->
        <div id="signupModal" class="modal">
            <div class="modal-content">
                <div class="row">
                    <form class="col s12">
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="sname" type="name" class="validate">
                                <label for="name">Name *</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="email" type="email" class="validate">
                                <label for="email">Email *</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <input id="password" type="password" class="validate">
                                <label for="password">Password *</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="cnfrmPassword" type="password" class="validate">
                                <label for="cnfrmPassword">Confirm Password *</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s3" ></div>
                            <div class="input-field col s4">
                                <button class="btn waves-effect red waves-light" type="button" name="action" id="signup_btn" onclick="javascript:signupAjax();">Submit
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                            <div class="input-field col s4">
                                <button class="btn waves-effect red waves-light" type="reset" name="action">Reset
                                    <i class="material-icons right">replay</i>
                                </button>
                            </div>
                            <div class="input-field col s3" ></div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!-- SignUp Modal End -->


		<!-- Parallex Start -->
			  <div class="parallax-container">
			    <div class="parallax"><img src="resources/img/bus2.jpg"></div>
			  </div>
			  <div class="section white">
			    <div class="row container">
			      <h2 class="header">BookMyBus.com</h2>
					<div class="row" id="bodyContainer">
						<div >
						    <form class="col s12">
							    <fieldset>
    							<legend>Find Your Ride</legend>
								<!-- <div class="row"> -->
<!-- 						        <div class="input-field col s6"> -->
<!-- 						          <input id="firstname" type="text" class="validate"> -->
<!-- 						          <label for="firstname">First Name</label> -->
<!-- 						        </div> -->
<!-- 						        <div class="input-field col s6"> -->
<!-- 						          <input id="lastname" type="text" class="validate"> -->
<!-- 						          <label for="lastname">Last Name</label> -->
<!-- 						        </div> -->
<!-- 						      </div> -->
						      <div class="row">
						        <div class="input-field col s12">
						          <input id="doj" type="text" class="datepicker" >
						          <label for="doj">Date of Journy</label>
						        </div>
						      </div>
						      <div class="row">
							      <div class="input-field col s6">
								    <select id="sourceCity">
								      <option value="NotSelected" disabled selected>Tap to Pick</option>
								      <option value="Delhi">Delhi</option>
								      <option value="Manali">Manali</option>
								      <option value="Kanpur">Kanpur</option>
								      <option value="Jaipur">Jaipur</option>
								      <option value="Amritsar">Amritsar</option>
								    </select>
								    <label>Source City</label>
								  </div>

								  <div class="input-field col s6">
								    <select id="destinationCity">
								      <option value="NotSelected" disabled selected>Tap to Pick</option>
								      <option value="Delhi">Delhi</option>
								      <option value="Manali">Manali</option>
								      <option value="Kanpur">Kanpur</option>
								      <option value="Jaipur">Jaipur</option>
								      <option value="Amritsar">Amritsar</option>
								    </select>
								    <label>Destination City</label>
								  </div>
							  </div>
							  <div class="center">
								  <button class="btn red waves-effect waves-light" type="button" name="action" id="search_buses_btn" onclick="validateSearchForm();">Search Buses
                                    <i class="material-icons right">search</i>
                                </button>
								</div>
								</fieldset>
						    </form>
						  </div>
			    </div>
			  </div>
			  </div>
			  <p id="result"></p>
			  <div class="parallax-container">
			    <div class="parallax"><img src="resources/img/bus1.jpg"></div>
			  </div>
			  <p id="value"></p>
		<!-- Parallex End -->
		<!-- Compiled and minified JQuery -->
    	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

		<!-- Compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
		<script src="resources/js/main.js"></script>

		<script>

		   $(document).ready(function(){
		      $('.parallax').parallax();
		      $('select').material_select();
		      $('.modal').modal(); // For Displaying Modals
		      $('.datepicker').pickadate({
			  selectMonths: true, // Creates a dropdown to control month
			  selectYears: 15, // Creates a dropdown of 15 years to control year,
			  format: 'dd-mm-yyyy',
			  today: 'Today',
			  clear: 'Clear',
			  close: 'Ok',
			  closeOnSelect: false // Close upon selecting a date,
			  });
		    });


</script>

<!-- <script type="text/javascript"> -->

<!--    function searchBusesAjax() { -->
<!--     $("#search_buses_btn").prop("disabled", true); -->
<!-- 		 $.ajax({ -->
<!-- 		          type:"GET", -->
<!-- 		          url:"Main.cfc?method=getBuses", -->
<!-- 		          data:{ -->
<!-- 		           	source : $("#sourceCity").val(), -->
<!-- 		           	destination:$("#destinationCity").val() -->
<!-- 		          }, -->
<!-- 		          cache:false, -->
<!-- 		          success: function(msg) { -->
<!-- 		          $("#value").html(msg); -->
<!-- 		          } -->
<!-- 		      }); -->

<!-- } -->
<!--   </script> -->

	</body>
</Html>