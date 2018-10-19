var open = false;

function toggleMobileNavLinks(){
		if(open){
			document.getElementById("mobileNavLinks").style.visibility = "hidden";
			open = false;
		}else{
			document.getElementById("mobileNavLinks").style.visibility = "visible";	
			open = true;
		}
}