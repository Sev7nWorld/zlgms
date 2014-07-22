<div style="margin-bottom:8px;margin-left:20px;">
	<a id="videopage" href="#" class="nav-top-item no-submenu" onclick="filmmanagerback()">返回</a>
</div>
<div>
	<table id="flexgrid"></table>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color:#fff;margin-top:-28px;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">影片管理</h3>
	</div>
	<div class="modal-body">
		<form id="staffform" class="form-horizontal" action="staffadd.php" method="post">
			<div class="control-group">
				<label class="control-label" for="inputEmail">影片名称</label>
				<div class="controls">
					<input type="text" id="videoname" name="videoname" placeholder="影片名称" style="color:#6699cc"> 
					<input type="hidden" id="videopageid">
					<input type="hidden" id="orderid">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputEmail">导演姓名</label>
				<div class="controls">
					<input type="text" id="directorname" name="directorname" placeholder="导演姓名" style="color:#6699cc"> 
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
				<label class="control-label" for="inputPassword">成片分享页面ID</label>
				<div class="controls">
					<input type="text" id="pageid" name="pageid" placeholder="成片分享页面ID" style="color:#6699cc">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">优酷视频SID</label>
				<div class="controls">
					<input type="text" id="youkuid" name="youkuid" placeholder="优酷视频SID" style="color:#6699cc">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">优酷视频密码</label>
				<div class="controls">
					<input type="text" id="youkupwd" name="youkupwd" placeholder="优酷视频密码" style="color:#6699cc">
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
				<label class="control-label" for="inputPassword">当前状态</label>
				<div class="controls">
					<select id="videostatus" style="color:#6699cc">
						<option value="1">制作中</option>
						<option value="2">已完成</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">发布状态</label>
				<div class="controls">
					<select id="isonline" style="color:#6699cc">
						<option value="1">已发布</option>
						<option value="2">未发布</option>
					</select>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
	<font id="paramtip" style=" margin-right:30px; float:left; margin-top:4px">建议：成片分享页面ID=宝贝姓名拼音全拼+拍摄时间八位数字</font>
		<button class="btn btn-primary" onclick="staffsubmit()">提交</button>
		
	</div>
</div>
<div id="myModal1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color:#fff">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">处理过程及结果记录</h3>
	</div>
	<div class="modal-body">
		<form id="staffform" class="form-horizontal" action="staffadd.php" method="post">
			<div class="control-group">
				<label class="control-label" for="inputEmail">处理记录</label>
				<div class="controls">
					<textarea id="oldrecord" rows="6" style="width:300px" ></textarea>
					<input id="adviseid" type="hidden">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputEmail">追加记录</label>
				<div class="controls">
					<textarea id="newrecord" rows="3" style="width:300px"></textarea>  
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" onclick="dealsubmit()">提交</button>
	</div>
</div>


<script type="text/javascript">
var orderid = {{orderid}};
$('#orderid').attr('value',orderid);
var colModel = "";
var buttons = "";
	colModel = [ {
                    display : '影片名称',
                    name : 'videoname',
                    width : 100,
                    sortable : true,
                    align : 'center'
                    }, {
                        display : '导演姓名',
                        name : 'directorname',
                        width : 150,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '当前状态',
                        name : 'videostatus',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '拍摄时间',
                        name : 'videodate',
                        width : 150,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '拍摄地点',
                        name : 'videoaddr',
                        width : 350,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '制作过程及结果记录',
                        name : 'dealprocess',
                        width : 120,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '成片分享页面ID',
                        name : 'pageid',
                        width : 200,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '成片分享页面状态',
                        name : 'isonline',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '优酷视频SID',
                        name : 'youkuid',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '优酷视频密码',
                        name : 'youkupwd',
                        width : 100,
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
                url : 'video/retrivebyparam?orderid=' + orderid,
                dataType : 'json',
				singleSelect : true,
                colModel : colModel,
                buttons : buttons,
                usepager : true,
                title : '影片管理',
                useRp : true,
                rp : 50,
                showTableToggleBtn : true,
                width : '60%',
                height : 500
            });  
	
	function staffmanager(com, grid) {
                if (com == '新增') {
                    $('#myModal').modal('toggle');
					$('#directorname').attr("value","");
	        		$('#pageid').attr("value","");
					$('#videoname').attr("value","");
	        		$('#videodate').attr("value","");
	        		$('#videoaddr').attr("value","");
					$('#videostatus').attr("value","");
					$('#youkuid').attr("value","");
					$('#youkupwd').attr("value","");
					$('#videopageid').attr("value","");
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
	        			url:"video/retrivebyid",
	        			type:"post",
						dataType : "json",
						data:{
							id:id
						},
	        			success:function(json)
	        			{
	        				$('#myModal').modal('toggle');
							$('#videoname').attr("value",json.VIDEONAME);
	        				$('#videodate').attr("value",json.VIDEODATE);
	        				$('#videoaddr').attr("value",json.VIDEOADDR);
	        				$('#videostatus').attr("value",json.STATUS);
							$('#youkuid').attr("value",json.YOUKUID);
							$('#youkupwd').attr("value",json.YOUKUPWD);
							$('#videopageid').attr("value",json.ID);
							$('#directorname').attr("value",json.DIRECTORNAME);
							$('#pageid').attr("value",json.PAGEID);
							$('#isonline').attr("value",json.ISONLINE);
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
			        			url:"video/delete",
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
		var un = $('#videopageid').val();
		var url = "video/create";
		if(un != "")
		{
			url = "video/update";
		}
		var arrId = [];  
		arrId[0] = 'videopic';
		arrId[1] = 'textpic';

		$.ajaxFileUpload({
			url : url,
			secureuri : false,
			fileElementId : arrId,
			data : {
				id:un,
				directorname:$('#directorname').val(),
				videoname:$('#videoname').val(),
	        	videoaddr:$('#videoaddr').val(),
				videodate:$('#videodate').val(),
				pageid:$('#pageid').val(),
				youkuid:$('#youkuid').val(),
				youkupwd:$('#youkupwd').val(),
	        	videostatus:$('#videostatus').val(),
				orderid:$('#orderid').val(),
				isonline:$('#isonline').val()	
			},
			success : function(msg) {
				$('#myModal').modal('hide');
				$('#flexgrid').flexOptions().flexReload();
			}
		});
	}
	
	function handlestatus(id,type)
	{
	if(type != '3')
		{
		$.ajax({
					url:"video/publish",
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
			window.open("http://www.zonglvguo.com/video?id=" + id);
		}
	}
	function howtodeal(id)
	{
		$('#adviseid').val(id);
		$.ajax({
				url:"video/dealsearch",
			        			type:"post",
								data:{
									aid:id
								},
			        			success:function(msg)
			        			{
									$('#newrecord').attr("value","");
									if(msg != null)
									{
										$('#oldrecord').val(msg);
									}
			        				$('#myModal1').modal('toggle');
			        			}
		});
		 
	}
	function dealsubmit()
	{
		var aid = $('#adviseid').val();
		$.ajax({
				url:"video/deal",
			        			type:"post",
								data:{
									aid:aid,
									content:$('#newrecord').val()
								},
			        			success:function(msg)
			        			{
									
			        				$('#myModal1').modal('hide');
			        			}
		});
	}
	
	function filmmanagerback()
	{
		$("#maincontent",parent.document.body).load("order");
	}
</script>

