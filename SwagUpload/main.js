function codesubmit() {
	var secretnumber = $("#code-value").val();

	// var myFirebaseRef = new Firebase("hackday-statsproject.firebaseIO.com");

	// myFirebaseRef.on("value", function(snapshot) {
	// 	alert(snapshot.val().secretCode);
	// });

	// location.replace("start.html?" + secretnumber);
	window.open("Start.html?"+secretnumber);
}