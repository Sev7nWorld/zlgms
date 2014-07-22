<div style="font-size:14px;">
	类型：
	<select id="status" style="color:#6699cc; margin-top:8px;">
		<option value="0">所有账号</option>
		<option value="1">超级管理员</option>
		<option value="2">管理员</option>
	</select>
	<font style="margin-left:10px;">帐号：</font>
	<input id="name" type="text" style="color:#6699cc; margin-top:8px;"> 
	<button class="btn btn-primary" onclick="staffsearch()" style="margin-left:10px; margin-top:-2px">查询</button>
</div>
<div>
	<table id="flexgrid"></table>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color:#fff">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">新增员工</h3>
	</div>
	<div class="modal-body">
		<form id="staffform" class="form-horizontal" action="" method="post">
			<div class="control-group">
				<label class="control-label" for="inputEmail">账号</label>
				<div class="controls">
					<input type="text" id="username" name="username" placeholder="账号" style="color:#6699cc"> 
					<input type="hidden" id="sid">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputEmail">密码</label>
				<div class="controls">
					<input type="text" id="password" name="password" placeholder="密码" style="color:#6699cc">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">类型</label>
				<div class="controls">
					<select id="type" style="color:#6699cc">
						<option value="1">超级管理员</option>
						<option value="2">管理员</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">电邮</label>
				<div class="controls">
					<input type="text" id="email" name="email" placeholder="电邮" style="color:#6699cc">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">城市</label>
				<div class="controls">
					<select id="city" style="color:#6699cc">
						<option value="1">北京</option>
						<option value="2">上海</option>
						<option value="3">广州</option>
						<option value="4">深圳</option>
						<option value="5">杭州</option>
						<option value="6">重庆</option>
						<option value="7">天津</option>
						<option value="8">长春</option>
						<option value="9">成都</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">手机</label>
				<div class="controls">
					<input type="text" id="mobile" name="mobile" placeholder="手机" style="color:#6699cc">
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" onclick="staffsubmit()">提交</button>
	</div>
</div>

<script type="text/javascript">
var colModel = "";
var buttons = "";
		colModel = [ {
                    display : '账号',
                    name : 'staffid',
                    width : 150,
                    sortable : true,
                    align : 'center'
                    }, {
                        display : '密码',
                        name : 'password',
                        width : 150,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '类型',
                        name : 'type',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '城市',
                        name : 'city',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '电邮',
                        name : 'staffemail',
                        width : 400,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '手机',
                        name : 'mobile',
                        width : 200,
                        sortable : true,
                        align : 'center'
                    }];
					
					buttons = [ {
                    name : '新增',
                    bclass : 'add',
                    onpress : staffmanager
                    }
                    ,
                    {
                        name : '修改',
                        bclass : 'edit',
                        onpress : staffmanager
                    }
                    ,
                    {
                        name : '删除',
                        bclass : 'delete',
                        onpress : staffmanager
                    }
                    ,
                    {
                        separator : true
                    } 
                ];
$("#flexgrid").flexigrid({
                url : 'staff/retrivebyparam?name=&s=0',
                dataType : 'json',
				singleSelect : true,
                colModel : colModel,
                buttons : buttons,
                usepager : true,
                title : '员工管理',
                useRp : true,
                rp : 50,
                showTableToggleBtn : true,
                width : '60%',
                height : 500
            });  
	
	function staffmanager(com, grid) {
                if (com == '新增') {
					$('#myModalLabel').text('新增员工');
                    $('#myModal').modal('toggle');
					$('#username').attr("readonly",false);
	        				//选择要显示的字段
	        		$('#username').attr("value","");
	        		$('#password').attr("value","");//密码
	        		$('#email').attr("value","");//如果数据不为空，则为修改操作
					$('#mobile').attr("value","");
					$('#city').attr("value","");
					$('#type').attr("value","");
					$('#username').attr("value","");
                }
                else if (com == '修改') {
                   if ($('.trSelected', $('#flexgrid')).length == 0){  
	            alert("请选中一行");
	            return;
	        }else
	        	{
				//从数据库取出数据，填充表格。
	        		id=$('.trSelected', $('#flexgrid')).attr("id").replace("row",""); 
	        		$.ajax({
	        			url:"staff/retrivebyid",
	        			type:"post",
						dataType : "json",
						data:{
							staffID:id
						},
	        			success:function(json)
	        			{
	        				$('#myModalLabel').text('编辑员工');
	        				$('#myModal').modal('toggle');
							$('#username').attr("readonly",true);
							var usertype = $('#usertype').val();
							if(usertype == 2)
							{
								$('#password').attr("readonly",true);
								$('#type').attr("disabled",true);
								$('#city').attr("disabled",true);
							}
	        				//选择要显示的字段
							$('#sid').attr("value",json.ID);
	        				$('#username').attr("value",json.STAFFID);
	        				$('#password').attr("value",json.PASSWORD);//密码
	        				$('#email').attr("value",json.STAFFEMAIL);//如果数据不为空，则为修改操作
							$('#mobile').attr("value",json.MOBILE);
							$('#city').attr("value",json.CITY);
							$('#type').attr("value",json.STAFFTYPE);
	        			}
	        		});
	        	}
                }
                else if (com == '删除') {
                   if ($('.trSelected', $('#flexgrid')).length == 0){  
	            alert("请选中一行");
	            return;
	        }else
	        	{
	        		if(confirm("确认要删除吗？"))
	        			{
			        		id=$('.trSelected', $('#flexgrid')).attr("id").replace("row",""); 
			        		$.ajax({//执行删除记录操作
			        			url:"staff/delete",
			        			type:"post",
								data:{
									staffID:id
								},
			        			success:function(msg)
			        			{
			        				$('#flexgrid').flexOptions().flexReload();
			        			}
			        		});
	        			}
	        	}
                }
            }
	function staffsubmit()
	{
		var un = $('#sid').val();
		var url = "staff/create";
		if(un != "")
		{
			url = "staff/update";
		}

		$.ajax({
			url:url,
			type:"POST",
			data:{
				id:un,
				username:$('#username').val(),
				password:$('#password').val(),
				type:$('#type').val(),
				mobile:$('#mobile').val(),
				city:$('#city').val(),
				email:$('#email').val()
			},
			success:function(msg)
			{
				$('#myModal').modal('hide');
				$('#flexgrid').flexOptions().flexReload();
			}
		});
	}
	
	function staffsearch()
	{
		var url = "staff/retrivebyparam?name=" + $('#name').val() + "&s=" + $("#status").val();
		$('#flexgrid').flexOptions({url:url}).flexReload();		
	}
</script>

