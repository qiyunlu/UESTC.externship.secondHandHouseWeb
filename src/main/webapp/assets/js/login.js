var LOGIN = {
	init:function()
	{	
		alert("1");
		$(".register-btn").click(function()
		{
			var useraccount = $(".input-style").eq(0).val();
			var email = $(".input-style").eq(1).val();
			var password = $(".input-style").eq(2).val()+","+$(".input-style").eq(3).val();
			
			var user = {
					"userAccount":useraccount,
					"email":email,
					"userPassword":password,
					"roleId":"1"
			}
			
			$.post("/user/register",user,function(msg)
			{
				$(".text-error").html(msg);
			},"text");
		});
	}
};