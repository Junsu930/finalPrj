$(document).ready(function() {
			$("#checkall").click(function() {
				if($("#checkall").is(":checked")) $("input[name=check]").prop("checked", true);
				else $("input[name=check]").prop("checked", false);
			});
			
			$("input[name=check]").click(function() {
				var total = $("input[name=check]").length;
				var checked = $("input[name=check]:checked").length;
				
				if(total != checked) $("#checkall").prop("checked", false);
				else $("#checkall").prop("checked", true); 
			});
		});
		
		