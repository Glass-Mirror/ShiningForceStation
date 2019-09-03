function onLoad(){
	try{
		var url = window.location.href;
		var id = url.split("#")[1];
		var finder = document.getElementById(id);
		var details = finder.nextElementSibling;
		details.style.outline = "thin solid gold";
	}catch(err){}
	}
	
	function onPress(){
		var list = document.getElementsByTagName("tr");
		for(var i=0; i<list.length; i++){
			list[i].style.outline = "";
		}
		try{
		onLoad();
		}catch(err){}
	}
	
	window.setInterval(onPress, 50);
	