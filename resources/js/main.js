/**
 * 
 * 
 */

function searchBusesAjax() { 	
    $("#search_buses_btn").prop("disabled", true);

		 $.ajax({
		          type:"GET",
		          dataType: 'json',
		          url:"Main.cfc?method=getBuses",
		          data:{
		           	source : $("#sourceCity").val(),
		           	destination:$("#destinationCity").val()
		          },
		          success: function(data) {
		        	  showBuses(data);
		      }

		 });
}

function showBuses(data){
	debugger;
	var doj = $("#doj").val();
	doj.trim();
	alert($("#doj").val());
     $("#bodyContainer").empty();
     
     
     var totalDistance = data.distance;
	 $.each(data.buses, function(idx, obj) {
		 debugger;
	     var busImgUrl = "resources/img/";
		 switch(obj.bus_id)
		 {
		 	
		 	case 1:
		 		busImgUrl = busImgUrl+"volvo.png";
		 		break;
		 	case 2:
		 		busImgUrl = busImgUrl+"haryana_roadways.jpg";
		 		break;
		 	case 3:
			 		busImgUrl = busImgUrl+"semi_delux.png";
			 		break;
		 	case 4:
		 		busImgUrl = busImgUrl+"delux.png";
		 		break;
		 	case 5:
		 		busImgUrl = busImgUrl+"high_capacity.png";
		 		break;
		 	case 6:
		 		busImgUrl = busImgUrl+"semi_delux.png";
		 		break;
		 	case 7:
		 		busImgUrl = busImgUrl+"delux.png";
		 		break;
		 	default:
		 		busImgUrl = busImgUrl+"No_image.png";
		 }
		 var fare = totalDistance * obj.travel_rate;
		 fare=Math.ceil(fare + (fare * (obj.tax_rate / 100)));
		 var childFare = Math.ceil(fare/1.5);
		 var busId = obj.bus_id;
		 var routeId = obj.route_id;
		 debugger;
		 $("#bodyContainer").append('<div class="col s4">\n\
				 <div class="card" id="' + obj.route_id + '">\n\
                 <div class="card-image">\n\
                     <img src= "' + busImgUrl + '" height="150" width="200">\n\
					 <a class="btn-floating halfway-fab waves-effect waves-light red" onclick="getSeatAvailabity('+busId+','+routeId+','+""+doj+');"><i class="material-icons">add</i></a>\n\
                     </div>\n\
     				<div class="card-content red lighten-5">\n\
						<span class="card-title"><b>' + obj.bus_name + '</b></span>\n\
						<table class="responsive-table">\n\
                        <tbody>\n\
                            <tr>\n\
                                <td><b>Source:</b></td>\n\
                                <td>'+obj.source+'</td>\n\
                            </tr>\n\
                            <tr>\n\
                                <td>Destination:</td>\n\
                                <td>'+obj.destination +'</td>\n\
                            </tr>\n\
                            <tr>\n\
                                <td><i>Departure</i></td>\n\
                                <td><i>'+obj.departure+'</i></td>\n\
                            </tr>\n\
                            <tr>\n\
                                <td><i>Arrival</i></td>\n\
                                <td><i>'+obj.arrival+'</i></td>\n\
                            </tr>\n\
                            <tr>\n\
                                <td>Type</td>\n\
                                <td>'+obj.bus_type+'</td>\n\
                            </tr>\n\
                            <tr>\n\
                            <td>Capacity</td>\n\
                            <td><b>'+obj.total_seats+'</b></td>\n\
                            </tr>\n\
                            <tr>\n\
                                <td><b>Adult Fare</b></td>\n\
                                <td><b>'+fare+'</b></td>\n\
                            </tr>\n\
                            <tr>\n\
                                <td><b>Child Fare</b></td>\n\
                                <td><b>'+(childFare)+'</b></td>\n\
                            </tr>\n\
                        </tbody>\n\
                    </table>\n\
					</div>\n\
				</div>\n\
         </div>');    
 });
}

function validateSearchForm(){
	
//	if( $("#firstname").val()===""){
//		Materialize.toast('Please Enter First Name.', 5000);
//		return;
//	}
//	if( $("#lastname").val()===""){
//		Materialize.toast('Please Enter Last Name.', 5000);
//		return;
//	}
	if( $("#doj").val()===""){
		Materialize.toast('Please Select date of journy.', 5000);
		return;
	}
	if( $("#sourceCity").val()==="NotSelected"){
		Materialize.toast('Please Enter First Name.', 5000);
		return;
	}
	if( $("#destinationCity").val()==="NotSelected"){
		Materialize.toast('Please Enter First Name.', 5000);
		return;
	}
	if( $("#sourceCity").val()===$("#destinationCity").val()){
		Materialize.toast('Source City and Destination City cannot be Same. ', 5000);
		return;
	}
	searchBusesAjax();
}


function getSeatAvailabity(busId,routeId,doj){
	debugger;
	alert (doj);
	var date = "17-10-2017";
	$.ajax({
        type:"GET",
        dataType: 'json',
        url:"Main.cfc?method=getSeats",
        data:{
         	busId : busId,
         	doj : date ,
         	routeId:routeId
        },
        success: function(data) {
      	showSeats(data);
    }

	});
	
	return true;
}

function showSeats(data){
	$("#seatAvailabityModal").empty();
	  $("#seatAvailabityModal").append('<div class="modal col s3" id="seatModal">\n\
				 <div class="modal-content">\n\
					<h4>Current Status:</h4>\n\
					 <p>Available Seats : '+ data.availableSeats +'</p>\n\
	                </div>\n\
					<div class="modal-footer">\n\
					 	<a class="modal-action modal-close waves-effect waves-red btn-flat" onclick="dismissModal()">Cancel</a>\n\
						<a class="modal-action modal-close waves-effect waves-green btn-flat" onclick="getBookingDetails()">Book Now !!!</a>\n\
					</div>\n\
				</div>'); 
	  $("#seatModal").modal();
	  $("#seatModal").show();
}

function dismissModal(){
	debugger;
	$('.modal').hide();
}

function getBookingDetails(){
	$("#seatAvailabityModal").empty();
	  $("#seatAvailabityModal").append('<div class="modal col s3" id="seatModal">\n\
					  <div class="modal-content">\n\
		              <div class="row">\n\
		                  <form class="col s12">\n\
							<div class="row">\n\
								<fieldset>\n\
		  							<legend>Booking Details</legend>\n\
									  <div class="input-field col s12">\n\
						              <input id="bookingFormName" type="name" class="validate">\n\
						              <label for="bookingFormName">Name* :</label>\n\
						          </div>\n\
		                      </div>\n\
							<div class="row">\n\
		                          <div class="input-field col s12">\n\
		                              <input  id="bookingFormAge" type="number" class="validate">\n\
		                              <label for="bookingFormAge">Age * :</label>\n\
		                          </div>\n\
		                      </div>\n\
		                      <div class="row">\n\
								<fieldset>\n\
								<legend>Gender</legend>\n\
		                              <p>\n\
											<input name="group1" type="radio" id="bookingFormRBMale" />\n\
											<label for="bookingFormRBMale">Male</label>\n\
										</p>\n\
										<p>\n\
										  <input name="group1" type="radio" id="bookingFormRBFemale" />\n\
										  <label for="bookingFormRBFemale">Female</label>\n\
										</p>\n\
										<p>\n\
										  <input class="with-gap" name="group1" type="radio" id="bookingFormRBOther"  />\n\
										  <label for="bookingFormRBOther">Other</label>\n\
										</p>\n\
										<p>\n\
									</fieldset>\n\
		                      </div>\n\
							  <div class="row">\n\
		                          <div class="input-field col s12">\n\
		                              <input id="bookingFormEmail" type="email" class="validate">\n\
		                              <label for="bookingFormEmail">Email* :</label>\n\
		                          </div>\n\
		                      </div>\n\
		                      <div class="row">\n\
								<fieldset>\n\
								<legend>Ticket Details</legend>\n\
		                              <div class="row">\n\
											<div class="input-field col s12">\n\
												<input id="bookingFormTicketCount" type="number" class="validate">\n\
												<label for="bookingFormTicketCount">No. of Tickets* :</label>\n\
											</div>\n\
										</div>\n\
									</fieldset>\n\
		                      </div>\n\
							  <div class="row">\n\
		                          <div class="input-field col s3" ></div>\n\
		                          <div class="input-field col s4">\n\
		                              <button class="btn waves-effect blue waves-light" type="button" name="action" \n\
			  										id="bookingFormBookTicketBtn" onclick="javascript:verifyEmail();">Book Now\n\
		                                  <i class="material-icons right">send</i>\n\
		                              </button>\n\
		                          </div>\n\
								  <div class="input-field col s4">\n\
					              <button class="btn waves-effect blue waves-light" type="button" \n\
													id="bookingFormCancelBtn" onclick="javascript:dismissModal();">Cancel\n\
					                  <i class="material-icons right">send</i>\n\
					              </button>\n\
					          </div>\n\
		                          <div class="input-field col s3" ></div>\n\
		                      </div>\n\
							<fieldset>\n\
		                  </form>\n\
		              </div>\n\
		          </div>\n\
				</div>');
	  $("#seatModal").modal();
	  $("#seatModal").show();
}

function verifyEmail(){
	debugger;
	var userEmail = $("#bookingFormEmail").val();
	alert ($("#bookingFormEmail").val());
	dismissModal();
//	var date = "17-10-2017";
	$.ajax({
        type:"GET",
        dataType: 'json',
        url:"Main.cfc?method=verifyEmail",
        data:{
         	email : userEmail
        },
        success: function(data) {
        	alert (data.otp);
        	var otp = data.otp;
        	$("#seatAvailabityModal").empty();
	      	  $("#seatAvailabityModal").append('<div class="modal col s3" id="seatModal">\n\
	      					  <div class="modal-content">\n\
	      						  <h4>Enter OTP:</h4>\n\
	      							 <p>We have Mailed you a OTP on the Email address you provided, Please verify that OTP here:</p>\n\
	      							  <div class="row">\n\
	      								<div class="input-field col s12">\n\
	      									<input id="otpField" type="number" class="validate">\n\
	      									<label for="otpField">OTP :</label>\n\
	      								</div>\n\
	      							</div>\n\
	      			              </div>\n\
	      							<div class="modal-footer">\n\
	      								<a class="modal-action modal-close waves-effect waves-green btn-flat" onclick="javascript:verifyotp('+ otp +');">Continue</a>\n\
	      							</div>\n\
	      							  <div class="input-field col s4">\n\
	      				              <button class="btn waves-effect blue waves-light" type="button" \n\
	      												id="bookingFormCancelBtn" onclick="javascript:dismissModal();">Cancel\n\
	      				                  <i class="material-icons right">send</i>\n\
	      				              </button>\n\
	      				          </div>\n\
	      						</div>');    
	      	  $("#seatModal").modal();
	      	  $("#seatModal").show();
      		
        	
    }
        

	});
	
//	return true;	
}

function verifyotp(data){
	if ($("#otpField").val() == data) {
		Materialize.toast('OTP Verified', 3000, 'rounded green');
		
	} else {
		Materialize.toast('incorrect OTP', 3000, 'rounded red');
	}
}
