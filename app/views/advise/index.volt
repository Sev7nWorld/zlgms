<div>
	状态：
	<select id="status" onchange="change()" style="color:#6699cc; margin-top:8px;">
		<option value="1">待处理</option>
		<option value="2">处理中</option>
		<option value="3">已处理</option>
	</select>
</div>
<div style="margin-top:10px;">
	<table id="flexgrid"></table>
</div>

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color:#fff;">
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
$("#flexgrid").flexigrid({
                url : 'advise/search?f=1',
                dataType : 'json',
                colModel : [ {
                    name : 'aid',
                    hide:true
                    },{
                    display : '生成时间',
                    name : 'time',
                    width : 120,
                    sortable : true,
                    align : 'center'
                    }, {
                        display : '状态',
                        name : 'status',
                        width : 60,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '投诉建议内容',
                        name : 'content',
                        width : 200,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '称呼',
                        name : 'name',
                        width : 30,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '电邮',
                        name : 'email',
                        width : 100,
                        sortable : true,
                        align : 'center'
                } , {
                        display : '手提',
                        name : 'mobile',
                        width : 100,
                        sortable : true,
                        align : 'center'
                } , {
                        display : '固话',
                        name : 'phone',
                        width : 100,
                        sortable : true,
                        align : 'center'
                }, {
                        display : '地址',
                        name : 'address',
                        width : 200,
                        sortable : true,
                        align : 'center'
                }  , {
                        display : '操作',
                        name : 'operation',
                        width : 140,
                        sortable : true,
                        align : 'center'
                } , {
                        display : '处理过程及结果记录',
                        name : 'howtodeal',
                        width : 140,
                        sortable : true,
                        align : 'center'
                } ],
                usepager : true,
                title : '投诉建议',
                useRp : true,
                rp : 50,
                showTableToggleBtn : true,
                width : '60%',
                height : 500,
				 buttons : [ {
                    name : '删除',
                    bclass : 'add',
                    onpress : advisemanager
                    }
                    ,
                    {
                        name : '清空',
                        bclass : 'edit',
                        onpress : advisemanager
                    }
                ]
            });  
	
	function advisemanager(com, grid) {
		var id = "";
		var flag = 1;
		if (com == '删除') {
              if ($('.trSelected', $('#flexgrid')).length == 0){  
	            alert("请至少选中一行");
	            return;
	        }else
			{
				 $.each($('.trSelected', grid),
                            function(key, value){
							  id += $(value).children().eq(0).text() + ",";
								
                        });  
				if(id.indexOf(",") > 0)
					id = id.substring(0,id.length - 1);
			}
			}else if(com=='清空')
			{
				flag = 2;
			}
		var status = $("#status").val();
		if(confirm("确认要删除吗？"))
	        			{
			        		$.ajax({//执行删除记录操作
			        			url:"advise/delete",
			        			type:"post",
								data:{
									id:id,
									flag:flag,
									status:status
								},
			        			success:function(msg)
			        			{
			        				$('#flexgrid').flexOptions().flexReload();
			        			}
			        		});
	        			}
	
	}
	function change()
	{
		var flag = $("#status").val();
		var url = "advise/search";
		if(flag == 1)	
		{
			url += "?f=1";
			$('#flexgrid').flexOptions({url:url}).flexReload();
		}else if(flag == 2)
		{
			url += "?f=2";
			$('#flexgrid').flexOptions({url:url}).flexReload();
		}else
		{
			url += "?f=3";
			$('#flexgrid').flexOptions({url:url}).flexReload();
		}
	}
	
	function handleadvise(id,flag)
	{
		$.ajax({
			        			url:"advise/handle",
			        			type:"post",
								data:{
									id:id,
									flag:flag
								},
			        			success:function(msg)
			        			{
			        				$('#flexgrid').flexOptions().flexReload();
			        			}
			        		});
	}
	function howtodeal(id)
	{
		$('#adviseid').val(id);
		$.ajax({
				url:"advise/dealsearch",
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
			        				$('#myModal').modal('toggle');
			        			}
		});
		 
	}
	function dealsubmit()
	{
		var aid = $('#adviseid').val();
		$.ajax({
				url:"advise/deal",
			        			type:"post",
								data:{
									aid:aid,
									content:$('#newrecord').val()
								},
			        			success:function(msg)
			        			{
									
			        				$('#myModal').modal('hide');
			        			}
		});
	}
</script>

