<!---
  --- Main
  --- ----
  ---
  --- author: Vishal Prasad
  --- date:   10/9/17
  --->
<cfcomponent  output="false">



    <!--  <cffunction name="getBuse" access="remote" output="true" returnformat="JSON"> -->
<!--          <cfargument name="source" type="string" required="yes"> -->
<!--          <cfargument name="destination" type="string" required="yes"> -->
<!--            <!--- some calculations here ---> -->
<!-- 		<cfset distanceApiUrl = "http://www.distance24.org/route.json?stops=" & #arguments.source# &"|" &#arguments.destination#> -->
<!-- 		<cfhttp url=#distanceApiUrl# method="get"/> -->
<!-- 		<cfset responseJSON = deserializeJSON(cfhttp.FileContent)/> -->
<!-- 		#responseJSON.distance# -->

<!--          #arguments.salesPrice# <!--- just to have something displayed ---> -->
<!--          <cfreturn> -->
<!--      </cffunction> -->

	<cffunction name="getBuses" access="remote" output="false" returnformat="JSON">
		<cfargument name="source" type="string" required="yes"> -->
        <cfargument name="destination" type="string" required="yes">

		<cfset distanceApiUrl = "http://www.distance24.org/route.json?stops=" & #arguments.source# &"|" &#arguments.destination#>
		<cfhttp url=#distanceApiUrl# method="get"/>
		<cfset responseJSON = deserializeJSON(cfhttp.FileContent)/>
		<cfset tripDistance = responseJSON.distance>


  <cfquery datasource="MySQL_bookMyBus" name="bus_details">
	select * from bus_routes, bus_service_providers
	 WHERE bus_routes.source = <cfqueryparam value="#arguments.source#" cfsqltype="cf_sql_varchar" />
	 and bus_routes.destination = <cfqueryparam value="#arguments.destination#" cfsqltype="cf_sql_varchar"  />
	 and bus_routes.bus_id = bus_service_providers.bus_id
  </cfquery>

  	<cfset busArray = [] />
	<cfloop query="bus_details">
		<cfset bus = {"bus_id"= bus_details.bus_id ,
					  "route_id" = bus_details.route_id ,
					  "source"  = bus_details.source ,
				      "destination" = bus_details.destination,
				      "departure" = bus_details.departure,
				      "arrival" = bus_details.arrival,
				      "total_seats" = bus_details.total_seats,
				      "bus_name" = bus_details.bus_name,
				      "bus_type" = bus_details.bus_type,
				      "travel_rate" = bus_details.travel_rate,
				      "tax_rate" = bus_details.tax_rate }/>
		<cfset arrayAppend(busArray, bus)>
		<cfset result={
		"distance" = tripDistance,
		"buses" = busArray} >
	</cfloop>
	<cfreturn result/>
    </cffunction>

<cffunction name="getSeats" access="remote" output="false" returnformat="JSON">
		<cfargument name="busId" type="int" required="yes"> -->
        <cfargument name="routeId" type="int" required="yes">
		<cfargument name="doj" type="string" required="yes">

  <cfquery datasource="MySQL_bookMyBus" name="booking_order">
	select no_of_tickets from booking_details, booking_order
	 WHERE booking_order.route_id = <cfqueryparam value="#arguments.routeId#" cfsqltype="cf_sql_int" />
	 and booking_details.date_of_journy = <cfqueryparam value="#arguments.doj#" cfsqltype="cf_sql_varchar"  />
	 and booking_details.booking_id = booking_order.booking_id
  </cfquery>

  <cfquery name="totalseats" datasource="MySQL_bookMyBus">
	SELECT * FROM bus_service_providers
	WHERE bus_id = <cfqueryparam value="#arguments.busId#" cfsqltype="cf_sql_int" />
  </cfquery>



		<cfset bookedTickets = booking_order.no_of_tickets>
		<cfset availableSeats = (totalseats.total_seats - bookedTickets)>
		<cfset seats = {"bus_id"= totalseats.bus_id ,
					 	"availableSeats" = availableSeats,
					 	"bookedTickets" = bookedTickets,
					 	"total"=totalseats.total_seats
					   }>
	<cfreturn seats/>
    </cffunction>


<cffunction name="verifyEmail" access="remote" output="false" returnformat="JSON">
		<cfargument name="email" type="string" required="yes"> -->
  		<cfset r = randRange(1000, 9999, "SHA1PRNG")>

		<!--- Mailing Start --->
	<cfmail from="vishuthedj@gmail.com" to="#arguments.email#" cc="vishuthedj@yahoo.in" subject="OTP form BookMyBus.com" type="html">
      <cfmailpart type="text" wraptext="60">
       OTP:
   </cfmailpart>

   <cfmailpart type="html">
       <html>
           <head>
                <style type="text/css">
               body {
               font-family:sans-serif;
               font-size:12px;
               color:navy;
               }
               </style>
            </head>
            <body>
               <p>Dear User,</p>
               <p> Your email Verification OTP is:</p>
        		<h1>#r#</h1>
           </body>
       </html>
   </cfmailpart>
</cfmail>

		<cfset otp = {"otp"= r
					   }>
	<cfreturn otp/>
    </cffunction>

</cfcomponent>