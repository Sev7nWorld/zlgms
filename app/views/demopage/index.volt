<div style="font-size:14px;">
	状态：
	<select id="status" style="color:#6699cc; margin-top:8px;">
		<option value="0">所有</option>
		<option value="1">已发布</option>
		<option value="2">未发布</option>
	</select>
	<font style="margin-left:10px;">影片名称：</font>
	<input id="name" type="text" style="color:#6699cc; margin-top:8px;">
	<button class="btn btn-primary" onclick="demosearch()" style="margin-left:10px; margin-top:-2px">查询</button>
</div>
<div>
	<table id="flexgrid"></table>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color:#fff;margin-top:-28px;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">示例页面</h3>
	</div>
	<div class="modal-body">
		<form id="staffform" class="form-horizontal" action="staffadd.php" method="post">
			<div class="control-group">
				<label class="control-label" for="inputEmail">影片名称</label>
				<div class="controls">
					<input type="text" id="videoname" name="videoname" placeholder="影片名称" style="color:#6699cc"> 
					<input type="hidden" id="demopageid">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputEmail">拍摄时间</label>
				<div class="controls">
					<input type="text" id="videodate" name="videodate" placeholder="拍摄时间" style="color:#6699cc" onclick="WdatePicker();">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">拍摄地点</label>
				<div class="controls">
					<input type="text" id="videoaddr" name="videoaddr" placeholder="拍摄地点" style="color:#6699cc">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">优酷视频SID</label>
				<div class="controls">
					<input type="text" id="videoid" name="videoid" placeholder="优酷视频SID" style="color:#6699cc">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">文案图片</label>
				<div class="controls">
					<input type="file" name="textpic" id="textpic" >
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">成片分享封面图片</label>
				<div class="controls">
					<input type="file" name="videopic" id="videopic" >
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">发布状态</label>
				<div class="controls">
					<select id="videostatus" style="color:#6699cc">
						<option value="1">已发布</option>
						<option value="2">未发布</option>
					</select>
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
                    display : '影片名称',
                    name : 'videoname',
                    width : 200,
                    sortable : true,
                    align : 'center'
                    }, {
                        display : '拍摄时间',
                        name : 'videodate',
                        width : 150,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '拍摄地点',
                        name : 'videoaddr',
                        width : 400,
                        sortable : true,
                        align : 'center'
                    },  {
                        display : '成片分享页面状态',
                        name : 'videostatus',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '优酷视频SID',
                        name : 'videoid',
                        width : 200,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '成片分享页面操作',
                        name : 'operation',
                        width : 150,
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
                url : 'demopage/searchbyparam?name=&s=0',
                dataType : 'json',
				singleSelect : true,
                colModel : colModel,
                buttons : buttons,
                usepager : true,
                title : '示例页面管理',
                useRp : true,
                rp : 50,
                showTableToggleBtn : true,
                width : '60%',
                height : 500
            });  
	
	function staffmanager(com, grid) {
                if (com == '新增') {
                    $('#myModal').modal('toggle');
					$('#videoname').attr("value","");
	        		$('#videodate').attr("value","");
	        		$('#videoaddr').attr("value","");
					$('#videostatus').attr("value","");
					$('#videoid').attr("value","");
					$('#demopageid').attr("value","");
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
	        			url:"demopage/searchbyid",
	        			type:"post",
						dataType : "json",
						data:{
							id:id
						},
	        			success:function(json)
	        			{
	        				$('#myModal').modal('toggle');
							$('#username').attr("readonly",true);

							$('#videoname').attr("value",json.VIDEONAME);
	        				$('#videodate').attr("value",json.VIDEODATE);
	        				$('#videoaddr').attr("value",json.VIDEOADDR);
	        				$('#videostatus').attr("value",json.VIDEOSTATUS);
							$('#videoid').attr("value",json.VIDEOID);
							$('#demopageid').attr("value",json.ID);
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
			        			url:"demopage/delete",
			        			type:"post",
								data:{
									id:id
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
		var un = $('#demopageid').val();
		var url = "demopage/create";
		if(un != "")
		{
			url = "demopage/update";
		}
		var arrId = [];  
		arrId[0] = 'videopic';
		arrId[1] = 'textpic';

		$.ajaxFileUpload({
			url : url,
			secureuri : false,
			fileElementId : arrId,
			dataType : 'text',
			data : {
				id:un,
				videoname:$('#videoname').val(),
	        	videoaddr:$('#videoaddr').val(),
				videodate:$('#videodate').val(),
				videoid:$('#videoid').val(),
	        	videostatus:$('#videostatus').val()	
			},
			success : function(msg) {
				$('#myModal').modal('hide');
				$('#flexgrid').flexOptions().flexReload();
			}
		});
	}
	
	function demosearch()
	{
		var url = "demopage/searchbyparam?name=" + $('#name').val() + "&s=" + $("#status").val();
		$('#flexgrid').flexOptions({url:url}).flexReload();
		
	}
	
	function handlestatus(id,type)
	{
		if(type != '3')
		{
			$.ajax({
						url:"demopage/deal",
						type:"post",
						data:{
							id:id,
							status:type
						},
						success:function(msg)
						{
							$('#flexgrid').flexOptions().flexReload();
						}
				 });
		}else
		{
			window.open("http://127.0.0.1/zonglvguo/order/videosample?id=" + id);
		}
	}
</script>

