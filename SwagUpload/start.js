function onlaunch() {
	var para = document.createElement("h2");
	var node = document.createTextNode("Your code is: " + getQueryVariable());
	para.appendChild(node);

	var element = document.getElementById("photo");
	element.appendChild(para);
}

function getQueryVariable(variable) {
    var path = window.location.search;
    path = path.substring(1);
    var number = Number(path);
    return number;
}