$(document).ready(function(e){
	$('#maincontent').load("order");
});
function gridChange(t)
{
	var srcID = t.id;
	var src = "";
	if(srcID == 'orderID')
		src = "order";
	else if(srcID == 'staffID')
		src = "staff";
	else if(srcID == 'recycle')
		src = "order/recycle";
	else if(srcID == 'adviseID')
		src = "advise";
	else if(srcID == 'searchif')
	{
		src = "quicksearch";
	}
	else if(srcID == 'demopage')
	{
		src = "demopage";
	}
	else if(srcID == 'exitsys')
	{
		window.location = "login/logout";
	}
	$('#maincontent').load(src);
}

