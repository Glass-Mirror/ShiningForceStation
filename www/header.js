var open = false;

function toggleMobileNavLinks(){
		if(open){
			document.getElementById("mobileNavLinks").style.display = "none";
			open = false;
		}else{
			document.getElementById("mobileNavLinks").style.display = "block";
			open = true;
		}
}
