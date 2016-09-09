$(document).ready(function() {
    // Initialize Firebase
    var config = {
        apiKey: "AIzaSyApOAG3EeyP8NLdSHrl2n4Snl0Z2R7d2UM",
        authDomain: "swagupload-494e7.firebaseapp.com",
        databaseURL: "https://swagupload-494e7.firebaseio.com",
        storageBucket: "swagupload-494e7.appspot.com",
    };
    firebase.initializeApp(config);

    var db = firebase.database().ref("codes");

    $("#btn-submit").click(function() {
        var secretnumber = $("#code-value").val();
        window.location.href = "./start.html?"+secretnumber;
        db.once('value', function(snapshot) {
            if(snapshot.hasChild(secretnumber)) {
            }

            else {
            }
        })
    });
});