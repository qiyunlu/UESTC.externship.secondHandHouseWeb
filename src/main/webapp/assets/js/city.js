var CITY = {
	init:function()
	{	
		//设置展开收起按钮的事件
		$(".opspread").click(function()
		{
			CITY.cityspread($(this));
		});
		$(".opputaway").click(function()
		{
			CITY.cityputaway($(this));
		});
		//查看city的相关信息
		$(".cityname").click(function()
		{
			CITY.findcityinfo($(this));
		});
		//保存dis表单中的信息
		$(".buttonsavedis").click(function()
		{
			var disinfo = $(".districtinfo")
			if(confirm("确定要保存编辑后的信息么？"))
			{
				CITY.savedisinfo(disinfo);
			}
		});
		//添加dis表单中的信息
		$(".buttonadddis").click(function()
		{
			var disinfo = $(".districtinfo")
			if(confirm("确定要保存编辑后的信息么？"))
			{
				CITY.adddisinfo(disinfo);
			}			
		});
		//为城市添加城区信息表格
		$(".btnaddareablock").click(function()
		{
			CITY.addareablock();
		});
		//保存编辑后的city的信息
		$(".saveupdatecity").click(function()
		{
			var thiscity = $(this).parent().prevAll();
			var remark = thiscity.eq(0).children().val();
			var pcityid = thiscity.eq(1).children().val();
			var cityname = thiscity.eq(2).children().val();
			var cityid = thiscity.eq(3).children().val();
			var cityinfo={
					"cityId":cityid,
					"parentCityId":pcityid,
					"cityName":cityname,
					"remark":remark
			}
			CITY.citysave(cityinfo);
		});
		//根据名称搜索城市
		$(".btnsearchcity").click(function()
		{
			var cityname=$(this).prev().val();
			$(".clearsearchcity").trigger("click");
			CITY.citysearch(cityname);
		});
		$(".clearsearchcity").click(function()
		{
			$(".clearsearchcity").prev().prev().val("");
			$(".clearsearchcity").next().remove();
		})
		//搜索area
		$(".btnsearcharea").click(function()
		{
			var areaname = $(this).prev().val();
			var table = $(this).prevAll().last();
			CITY.areasearch(areaname,table);
		});
		//搜索district
		$(".buttonsearchdis").click(function()
		{
			var disname = $(this).prev().val();
			CITY.searchdis(disname);
		})
		//鼠标点到其他地点取消某些信息栏的显示
		$("body").click(function(e)
		{
			var x= e.pageX;
			var y= e.pageY;
			var mousexy={
					"x":x,
					"y":y
				};
			
			if( !$(".districtinfo").hasClass("hidden") )
			{
				if(CITY.isclickinfield(mousexy,$(".districtinfo"))==0)
				{
					if($(e.target).parentsUntil("tr").last().is('td'))
					{
						return;
					}
					else
					{
						$(".map").find("img").removeAttr("src");
						$(".districtinfo").addClass("hidden");
						$(".banner").removeClass("hidden");
					}
				}
			}
			
			if( !$(".cityinfo").hasClass("hidden") )
			{
				if( !$(".districtinfo").hasClass("hidden") )
				{
					if(CITY.isclickinfield(mousexy,$(".cityinfo"))==0 && CITY.isclickinfield(mousexy,$(".districtinfo"))==0)
					{
						if($(e.target).hasClass("cityname"))
						{
							return;
						}
						else
						{
							$(".map").find("img").removeAttr("src");
							$(".cityinfo").addClass("hidden");
							$(".citypage").removeClass("hidden");
							$(".banner").removeClass("hidden");
						}
					}
				}
				else
				{
					if(CITY.isclickinfield(mousexy,$(".cityinfo"))==0)
					{
						if($(e.target).hasClass("cityname") || $(e.target).hasClass("opspread") || $(e.target).hasClass("opputaway") )
						{
							return;
						}
						else
						{
							$(".map").find("img").removeAttr("src");
							$(".cityinfo").addClass("hidden");
							$(".citypage").removeClass("hidden");
							$(".banner").removeClass("hidden");
						}
					}
				}
			}
		});
	},
	
	//判断鼠标点击处是否位于某个区域内
	isclickinfield:function(mousexy,field)
	{
		var thisfield = field;
		var x = mousexy.x;
		var y = mousexy.y;
		var xl=thisfield.offset().left;
		var xr=xl+thisfield.width();
		var yt=thisfield.offset().top;
		var yb=yt+thisfield.height();
		if( x>=xl && x<=xr && y>=yt && y<=yb )
		{
			return 1;
		}
		else
		{
			return 0;
		}
	
	},
	
	//city相关
	citycreate:function(obj)
	{
		var city = $('<li class="city"></li>');
		var cityId = $('<a class="hidden"></a>').html(obj.cityId);
		var cityName = $('<a class="cityname"></a>').html(obj.cityName);
		
		cityName.click(function()
		{
			CITY.findcityinfo($(this));
		}
		);
		var buttonspread = $('<input type="button" class="opspread" value="展开"/>');
		buttonspread.click(function()
		{
			CITY.cityspread($(this));
		});
		var buttonputaway = $('<input type="button" class="opputaway hidden" value="收起"/>')
		buttonputaway.click(function()
		{
			CITY.cityputaway($(this));
		});
		city.append(cityId).append(cityName).append(buttonspread).append(buttonputaway);		
		return city;
	},
	cityspread:function( element )
	{
		var thiscity = $( element ).parent();
		var a = thiscity.children().first().html();
		$.get("/city/findchildrenbyid/"+a,function(data){
			var ccitylist = $('<ul class="citylist"></ul>');
			$.each( data, function(i, city){
				var city = CITY.citycreate(city);
				ccitylist.append(city);
			});
			thiscity.append(ccitylist);
		}, "json");
		$(element).addClass("hidden");
		var opp = $(element).next();
		opp.removeClass("hidden");
	},
	cityputaway:function( element )
	{
		var thiscity = $(element).parent();
		thiscity.children().last().remove();
		$(element).addClass("hidden");
		var ops = $(element).prev();
		ops.removeClass("hidden");
	},
	findcityinfo:function( element )
	{
		//获得选中城市的id
		$(".cityinfo").removeClass("hidden");
		
		$(".citypage").addClass("hidden");
		var thiscity = $( element ).parent();
		var a = thiscity.children().first().html();
		
		$.get("/city/findcitybyid/"+a,function(city){
			
			var cityinfo = $(".cityinfo").find("li");
			
			cityinfo.first().children().val(city.cityId);
			$("#cityId").val(city.cityId);
			cityinfo.first().next().children().val(city.cityName);
			cityinfo.first().next().next().children().val(city.parentCityId);
			cityinfo.first().next().next().next().children().val(city.remark);
			$(".map").find("img").attr("src","/assets/image"+city.map);
			$(".map").find("img").removeClass("hidden");
			$(".banner").addClass("hidden");
			
			var a = cityinfo.first().children().val();
			$.get("/area/findareabycityid/"+a,function(data)
			{
				var areatable = $(".areapage").children().first();
				areatable.empty();
				areatable.append('<tr><td>区域编号</td><td>区域名称</td><td>包含片区</td><td>区域简介</td><td>地图</td><td>操作</td></tr>')
				$.each( data , function( i , area )
				{
					var Area = CITY.createarea( area );
					areatable.append( Area );
				});
			},"json")
		},"json");
	},
	//保存编辑后的CITY信息
	citysave:function(cityinfo)
	{
		$.post("/city/updatecity",cityinfo,function(result)
		{
			if(result==1)
			{
				alert("修改成功");
			}
			else
			{
				alert("保存失败");
			}
		},"JSON");
	},
	//搜索城市
	citysearch:function(cityname)
	{
		$.get("/city/findcitybyname/"+cityname,function(sclist)
		{
			var scl = $('<ul class="searchcitylist"></ul>')
			$.each(sclist,function(i,city)
			{
				var sc = CITY.citycreate(city);
				scl.append(sc);
			});
			$(".searchcitylist").append(scl);
		},"JSON");
	},
	
	//area相关
	//创建area表
	createarea:function( area )
	{
		
		var Area = $('<tr></tr>');
		
		var areaId = $('<td></td>').html(area.areaId);
		
		var areaName = $('<td></td>').html(area.areaName);
		areaName.click(function()
		{
			$(".map").find("img").attr("src","/assets/image"+area.map);
			$(".banner").addClass("hidden");
		});
		
		var buttondisspread = $('<input value="展开" class="btndissp" type="button"/>');
		var buttondisputaway = $('<input value="收起" class="btndispa hidden" type="button"/>');
		var buttondisadd = $('<input value="新增" type="button"/>');
		//展开地区列表
		var district = $('<td></td>').append(buttondisspread).append(buttondisputaway).append(buttondisadd);
		buttondisspread.click(function()
		{	
			var areaId = $(this).parent().parent().children().first().html();
			var uldis = CITY.createuldis(areaId);
			$(this).after(uldis);
			$(this).addClass("hidden");
			$(this).next().next().removeClass("hidden");
		});
		//收起地区列表
		buttondisputaway.click(function()
		{
			$(this).prev().remove();
			$(this).addClass("hidden");
			$(this).prev().removeClass("hidden");
		});
		//添加还未有所属的地区的列表
		buttondisadd.click(function()
		{
			if( $( ".seladddis" ).length == 0 )
			{
				var list = $('<select class="seladddis"></select>');
				var nullsel = $('<option value="0"></option>').html("null");
				list.append(nullsel);
				$.get("/district/finddistrictbyareaid/0",function(data)
				{
					
					$.each(data,function(i,district){
						var disli = $('<option value="'+district.districtId+'" ></option>').html(district.districtName);
						list.append(disli);
					});	
					
				},"json")
				//将选择地区添加给城区
				var btnupdateadd = $('<input type="button" class="btnupdateadd" value="确认添加"></input>')
				btnupdateadd.click(function()
				{
					var did = $(this).prev().val();
					var dname = $(this).prev().find("option[value="+did+"]").html();
					var aid = areaId.html();
					var dis = {
							"districtId":did,
							"areaId":aid,
							"districtName":dname
					};
					$.post("/district/savedistrictinfo",dis,function(result)
					{
						var r = eval("(" + result + ")");
						if(r==1)
						{
							alert("添加成功！");
							var btn = $(".btndispa");
							var l=btn.length;
							for( var i = 0 ; i < l ; i++ )
							{
								if( btn.eq(i).hasClass("hidden")  )
								{
								}
								else
								{
									btn.eq(i).trigger("click");	
									btn.eq(i).prev().trigger("click");			
								}
							}
							$(".seladddis").remove();
							$(".btnupdateadd").remove();
						}
						else
						{
							alert("添加失败！");
						}
					},"json");
				})
				var a = $(this).after(list);
				list.after(btnupdateadd);
			}
		});
		var remark = $('<td></td>').html(area.remark);
		//编辑城区信息
		var btnupdatearea = $('<input type="button" class="btnupdatearea" value="编辑" />')
		btnupdatearea.click(function()
		{
			var areaN = $(this).parent().parent().children().eq(1);
			var inputName = $('<input type="text" value="'+areaN.html()+'" />');
			areaN.html("");
			areaN.append(inputName);
			
			var areaR = $(this).parent().parent().children().eq(3);
			var inputRemark = $('<input type="text" value="'+areaR.html()+'" />');
			areaR.html("");
			areaR.append(inputRemark);
			
			
			$(this).addClass("hidden");
			
			
			var btnsaveupdatearea = $('<input  type="button" class="btnupdatearea" value="保存修改" />');
			btnsaveupdatearea.click(function()
			{
				if(confirm("确定保存修改么？"))
				{
					var thisarea = $(this).parent().parent();
					
					aid = thisarea.children().eq(0).html();
					
					var inputname = thisarea.children().eq(1);
					aname = inputname.children().val();
					inputname.children().remove();
					inputname.html(aname);
					
					cid = $(".cityinfo").children().first().children().val();
					
					var inputremark = thisarea.children().eq(3);
					remark = inputremark.children().val();
					inputremark.children().remove();
					inputremark.html(remark);
					
					area={
							"areaId":aid,
							"areaName":aname,
							"cityId":cid,
							"remark":remark
						};
					
					$.post("/area/updatearea",area,function(result)
					{
						if(result==1)
						{
							alert("修改成功！");
						}
						else
						{
							alert("修改失败！");
						}
					},"JSON");
					
					$(this).prev().removeClass("hidden");
					$(this).remove();
				}
			});
			$(this).after(btnsaveupdatearea);
		});
		//删除城区
		var btndeletearea = $('<input  type="button" class="btndeletearea" value="删除" />');
		btndeletearea.click(function()
		{
			var aid = $(this).parent().prevAll().last().html();
			var thisarea = $(this).parent().parent();
			if(confirm("确定删除该城区么？"))
			{
				$.get("/area/deletearea/"+aid,function(result)
				{
					if(result==1)
					{
						thisarea.remove();
					}	
					else
					{
						alert("删除失败！");
					}
				},"JSON")
			}
		});
		//添加城区地图
		var mapform = $('<form action="/area/addareamap" method="post" enctype="multipart/form-data"></form>');
		var hiddenId = $('<input name="areaId" type="hidden">').val(area.areaId);
		var btnmapsel = $('<div class="divareamap"><a>选择地图</a><input  type="file" name="areamap" value="选择地图" /></div>');
		var btnmapadd = $('<input  type="submit" class="btnareamapselect" value="保存地图" />');
		mapform.append(hiddenId).append(btnmapsel).append(btnmapadd);
		var areamap = $('<td></td>').append(mapform);
		
		var btnop = $('<td></td>').append(btnupdatearea).append(btndeletearea);
		Area.append(areaId).append(areaName).append(district).append(remark).append(areamap).append(btnop);
		
		return  Area;
	},
	//添加新城区的表格用以填写数据
	addareablock:function()
	{
		var areatable = $(".areapage").find("table");
		if( $(".newareablock").length==0 )
		{
			var newblock = $('<tr class="newareablock"></tr>');
			var areaName = $('<td><input type="text"/></td>');
			var remark = $('<td><input type="text"/></td>');
			var opbtn = $('<td></td>');
			var btnareaadd = $('<input type="button" value="确认添加城区" class="btnareaadd"/>');
			btnareaadd.click(function()
			{	
				if(confirm("确定要保存新城区"+areaName.children().first().val()+"么？"))
				{
					CITY.addarea(newblock);
				}
			});
			var btngiveup = $('<input type="button" value="取消" class="btngiveup"/>');
			btngiveup.click(function()
			{
				if(confirm("取消后表格信息将不会保存，确认取消么？"))
				{
					$(".newareablock").remove();
				}
			});
			opbtn.append(btnareaadd).append(btngiveup);
			newblock.append('<td></td>').append(areaName).append('<td></td>').append(remark).append(opbtn);
			areatable.append(newblock);
		}
	},
	//添加城区
	addarea:function(newblock)
	{
		var aname = $.trim( newblock.find("input:eq(0)").val() );
		var r = $.trim( newblock.find("input:eq(1)").val() );
		var cid = $.trim( newblock.parents(".cityinfo").find("input:eq(0)").val() );
		
		var area = {"areaName":aname,
					 "cityId":cid,
					 "remark":r
					}
		
		$.post("/area/addarea",
				area,
				function(result)
				{
					var r = eval("(" + result + ")");
					if(r==1)
					{
						alert("保存成功！");
						$(".newareablock").remove();
						for( var i = 0 ; i < $("li.city").length ; i++ )
						{
							if( $("li.city").find(".hidden").eq(i).html() == cid )
							{
								$("li.city").find(".hidden").eq(i).next().trigger("click");
							}
						}
						
					}
					else
					{
						alert("保存失败!");
					}
				},
				"json");
	},
	//搜索area
	areasearch:function( areaname , table ){
		
		if(areaname=="")
		{
			return;
		}
		else
		{
			table.empty();
			$.get("/area/findbyname/"+areaname,function(salist)
			{
				var areatable = $(".areapage").find("table");
				$.each(salist,function(i,area)
				{
					var sa = CITY.createarea(area);
					areatable.append(sa);
				});
			},"JSON");
		}
	},
	
	//district相关
	//创建dis表
	createuldis:function(areaId)
	{
		var uldis = $('<ul class="uldis"></ul>');
		uldis.css("padding-left","0");
		$.get("/district/finddistrictbyareaid/"+areaId,function(data)
		{
			$.each(data,function(i,district){
				var districtId = $('<li class="hidden"></li>').html(district.districtId);
				var districtName=$('<li></li>').html(district.districtName);
				districtName.click(function()
				{
					CITY.finddistrictinfo(district.districtId);		
					$(".banner").addClass("hidden");
				});
				uldis.append(districtId).append(districtName);
			});	
		},"json");
		return uldis;
	},
	//查找并显示dis信息
	finddistrictinfo:function(districtId)
	{
		$(".districtinfo").removeClass("hidden");
		var districttable = $(".districtinfo").children().first().children().first();
		$.get("/district/finddistrictbydistrictid/"+districtId,function(district)
		{
			districttable.find("input:eq(0)").val(district.districtId);
			$("input[name='disId']").val(district.districtId);
			districttable.find("input:eq(1)").val(district.districtName);
			districttable.find("select").val(district.areaId);
			var dismap = $('<img />').attr("src","/assets/image"+district.map);
			$(".map").find("img").attr("src","/assets/image"+district.map);
			
			/*for(var i=0 ; i<districttable.find("option").length ;i++ )
			{
				if( districttable.find("option:eq("+i+")").val()==district.areaId )
				{
					districttable.find("option:eq("+i+")").attr("selected","selected");
				}
			}*/
			districttable.find("input:eq(2)").val(district.remark);
		},"json");
	},
	//修改dis的信息
	savedisinfo:function(disinfo)
	{
		var did = $.trim( disinfo.find("input:eq(0)").val() );
		disinfo.find("input:eq(0)").val("");
		var dname = $.trim( disinfo.find("input:eq(1)").val() );
		disinfo.find("input:eq(1)").val("");
		var r = $.trim( disinfo.find("input:eq(2)").val() );
		disinfo.find("input:eq(2)").val("");
		var aid = $.trim( disinfo.find(":selected").val() );
		disinfo.find("select").val("0");
		$.post("/district/savedistrictinfo",
				{"districtId":did,
				 "districtName":dname,
				 "areaId":aid,
				 "remark":r
				},
				function(result)
				{
					var r = eval("(" + result + ")");
					if(r==1)
					{
						alert("保存成功！");
						var btn = $(".btndispa");
						var l=btn.length;
						for( var i = 0 ; i < l ; i++ )
						{
							if( btn.eq(i).hasClass("hidden")  )
							{
							}
							else
							{
								btn.eq(i).trigger("click");	
								btn.eq(i).prev().trigger("click");			
							}
						}
						/*if( $(".btndispa").hasClass("hidden") )
						{
							$(".btndispa").trigger("click");
							$(".btndissp").trigger("click");
						}*/
					}
					else
					{
						alert("保存失败!");
					}
				},
				"json");
	},
	//添加dis
	adddisinfo:function(disinfo)
	{
		
		var dname = $.trim( disinfo.find("input:eq(1)").val() );
		disinfo.find("input:eq(1)").val("");
		var r = $.trim( disinfo.find("input:eq(2)").val() );
		disinfo.find("input:eq(2)").val("");
		var aid = $.trim( disinfo.find(":selected").val() );
		disinfo.find("select").val("0");
		$.post("/district/adddistrictinfo",
				{"districtName":dname,
				 "areaId":aid,
				 "remark":r
				},
				function(result)
				{
					var r = eval("(" + result + ")");
					if(r==1)
					{
						alert("添加成功！");
						var btn = $(".btndispa");
						var l=btn.length;
						for( var i = 0 ; i < l ; i++ )
						{
							if( btn.eq(i).hasClass("hidden")  )
							{
							}
							else
							{
								btn.eq(i).trigger("click");	
								btn.eq(i).prev().trigger("click");			
							}
						}
						/*if( $(".btndispa").hasClass("hidden") )
						{
							$(".btndispa").trigger("click");
							$(".btndissp").trigger("click");
						}*/
					}
					else
					{
						alert("添加失败!");
					}
				},
				"json");
	},
	//搜索dis
	searchdis:function( disname )
	{
		var ulsearchdis = $('<ul></ul>');
		$.get("/district/findbyname/"+disname,function(sdlist)
		{
			$.each(sdlist,function(i,district){
				var districtId = $('<li class="hidden"></li>').html(district.districtId);
				var districtName=$('<li></li>').html(district.districtName);
				districtName.click(function()
				{
					CITY.finddistrictinfo(district.districtId);		
				});
				ulsearchdis.append(districtId).append(districtName);
			});
		},"JSON");
		$(".buttonsearchdis").after(ulsearchdis);
	}
};