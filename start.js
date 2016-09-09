$(document).ready(function() {
    var code = getQueryVariable();

    var storage = firebase.storage();

    var imgName;
    var img;

    var db = firebase.database().ref("code");

    db.once('value', function(snapshot) {
        if(snapshot.hasChild(code.toString())) {
            var url = snapshot.child(code).val();
            $("#userimg").attr("src", url);
            $("#imgsrc").attr("href", url);
            $("#imgsrc").attr("download", "");
        }
    });

    function getQueryVariable() {
        var path = window.location.search;
        path = path.substring(1);
        var number = Number(path);
        return number;
    }
});