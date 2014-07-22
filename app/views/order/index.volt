<div style="color:#3399cc;">
	<font>订单状态：</font>
	<select id="status" style="margin-top:8px;color:#3399cc;">
		<option value="1">待处理</option>
		<option value="2">制作中</option>
		<option value="3">已完成</option>
		<option value="4">所有订单</option>
	</select>
	<font style="margin-left:10px;">订单管理人：</font>
	<input id="cperson" type="text" style="width:160px;margin-top:8px;color:#3399cc;">
	<font style="margin-left:10px;">宝贝姓名：</font>
	<input id="name" type="text" style="width:160px;margin-top:8px;color:#3399cc;"> 
	<button class="btn btn-primary" onclick="ordersearch()" style="margin-left:10px;margin-top:-2px;">查询</button>
</div>
<div>
	<table id="flexgrid"></table>
</div>
<div id="myModal" class="modal hide fade" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" style="width:900px; margin-left:-450px; height:390px;color:#fff;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">新增订单</h3>
	</div>
	<div class="modal-body" style="height:300px;">
		<form id="orderform" class="form-horizontal" action="orderadd.php" method="post">
			<table class="table" width="600" border="0" style="height:400px;">
				<tr style="height:10px;">
					<td style="width:120px;">
						<div class="control-group" style="margin-left:-40px; height:10px;">
							<label class="control-label" for="inputEmail" >订单编号</label>
							<div class="controls">
								<input type="text" id="orderid" name="orderid" placeholder="订单编号" style="width:120px;color:#3399cc" readonly="readonly">
								<input type="hidden" id="sid">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">订单创建人</label>
							<div class="controls">
								<input type="text" id="createperson" name="createperson" style="width:120px;color:#3399cc" readonly="readonly" value="{{username}}">
								<input type="hidden" id="oid">
								<input type="hidden" id="orderidforcharge">
							</div>
						</div>
					</td> 
				</tr>
				<tr style="height:10px;">
					<td style="width:120px;">
						<div class="control-group" style="margin-left:-40px; height:10px;">
							<label class="control-label" for="inputEmail" >*&nbsp产品规格</label>
							<div class="controls">
								<select id="producttype" style="width:120px;color:#3399cc" onchange="countprice()">
									<option value="jizhi">极致版</option>
									<option value="zunxiang">尊享版</option>
									<option value="diancang">典藏版</option>
								</select>
							</div>
						</div>
					</td>
					<td style="width:120px;">
						<div class="control-group" style="margin-left:-40px; height:10px;">
							<label class="control-label" for="inputEmail" >*完美记忆套装</label>
							<div class="controls">
								<select id="memorysuit" style="width:120px;color:#3399cc" onchange="countprice()">
									<option value="1">是</option>
									<option value="0">否</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">所在城市</label>
							<div class="controls">
								<input type="text" id="city" name="city" placeholder="所在城市" style="width:120px;color:#3399cc" class="inputcss1">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">额外选配馈赠礼盒</label>
							<div class="controls">
								<input type="text" id="dvdnum" name="dvdnum" placeholder="单位：盒" style="width:120px;color:#3399cc" class="inputcss1" onkeyup="countprice()">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td colspan="2">
						<div class="control-group" style="height:10px;width:600px">
							<label class="control-label" for="inputEmail" style="width:290px;">成片和馈赠礼盒是否印制棕榈果标识</label>
							<div class="controls">
								<select id="isprint" style="width:120px;color:#3399cc;margin-left:20px;" onchange="countprice()"><option value="1">是</option><option value="0">否</option></select>
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">用户姓名</label>
							<div class="controls">
								<input type="text" id="customername" name="customername" placeholder="用户姓名" style="width:120px;color:#3399cc">
							</div>
						</div>
					</td>
					<td style="width:120px;">
						<div class="control-group" style="margin-left:-40px; height:10px;">
							<label class="control-label" for="inputEmail" >用户手提</label>
							<div class="controls">
								<input type="text" id="customermobile" name="customermobile" placeholder="用户手提" style="width:120px;color:#3399cc">
							</div>
						</div>
					</td>	
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">用户固话</label>
							<div class="controls">
								<input type="text" id="customerphone" name="customerphone" placeholder="用户固话" style="width:120px;color:#3399cc">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">用户电邮</label>
							<div class="controls">
								<input type="text" id="customeremail" name="customeremail" placeholder="用户电邮" style="width:120px;color:#3399cc">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td colspan="2">
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">用户地址</label>
							<div class="controls">
								<input type="text" id="customeraddress" name="customeraddress" placeholder="用户地址" style="width:500px;color:#3399cc">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td style="width:120px;">
						<div class="control-group" style="margin-left:-40px; height:10px;">
							<label class="control-label" for="inputEmail" >*&nbsp宝贝父亲</label>
							<div class="controls">
								<input type="text" id="fathername" name="fathername" style="width:120px;color:#3399cc"  class="validate[required] inputcss1" maxlength="100">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">父亲手提</label>
							<div class="controls">
								<input type="text" id="fathermobile" name="fathermobile" style="width:120px;color:#3399cc"  class="inputcss1">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">*&nbsp;宝贝母亲</label>
							<div class="controls">
								<input type="text" id="mothername" name="mothername" style="width:120px;color:#3399cc" class="validate[required] inputcss1" maxlength="100">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">母亲手提</label>
							<div class="controls">
								<input type="text" id="mothermobile" name="mothermobile" style="width:120px;color:#3399cc">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">*&nbsp;宝贝姓名</label>
							<div class="controls">
								<input type="text" id="babyname" name="babyname" style="width:120px;color:#3399cc" onkeyup="generateorder()" class="validate[required] inputcss1" maxlength="100">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">宝贝乳名</label>
							<div class="controls">
								<input type="text" id="babynickname" name="babynickname" style="width:120px;color:#3399cc">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">*&nbsp;宝贝性别</label>
							<div class="controls">
								<select id="babysex" style="width:120px;color:#3399cc">
									<option value="1">男</option>
									<option value="2">女</option>
								</select>
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">宝贝生日</label>
							<div class="controls">
								<input type="text" id="babybirthday" name="babybirthday" class="validate[required] inputcss1" oninput="generateorder()" onchange="generateorder()" style="width:120px;color:#3399cc" onclick="WdatePicker();generateorder();">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">合计费用</label>
							<div class="controls">
								<input type="text" id="charge" name="charge" style="width:120px;color:#3399cc" readonly="readonly">
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">第三方支付订单号</label>
							<div class="controls">
								<input type="text" id="thirdorderid" name="thirdorderid" style="width:120px;color:#3399cc" readonly="readonly">
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td style="width:120px;">
						<div class="control-group" style="margin-left:-40px; height:10px;">
							<label class="control-label" for="inputEmail" >在线支付状态</label>
							<div class="controls">
								<select id="onlineorderstatus" style="width:120px;color:#3399cc" disabled="true">
									<option value="1">已支付</option>
									<option value="2" selected="selected">未支付</option>
								</select>
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">线下支付状态</label>
							<div class="controls">
								<select id="offlineorderstatus" style="width:120px;color:#3399cc" onchange="compareonline()">
									<option value="1">已支付</option>
									<option value="2" selected="selected">未支付</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr style="height:10px;">
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">订单状态</label>
							<div class="controls">
								<select id="orderstatus" style="width:120px;color:#3399cc;" disabled="true">
									<option value="1" >待处理</option>
									<option value="2" selected="selected">制作中</option>
									<option value="3">已完成</option>
								</select>
							</div>
						</div>
					</td>
					<td>
						<div class="control-group" style="margin-left:-40px;height:10px;">
							<label class="control-label" for="inputEmail">订单管理人</label>
							<div class="controls">
								<input type="text" id="ordermanager" name="ordermanager" placeholder="订单管理人" style="width:120px;color:#3399cc" class="inputcss1">
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="submitdiv" class="modal-footer">
		<button  class="btn btn-primary" onclick="generateorder();ordersubmit()" style="float:left;margin-left:780px;">提交</button>
		<font id="paramtip" style=" margin-right:30px; float:left; margin-left:460px;margin-top:-22px">标*的必填项全部填写完整后才能成功提交订单</font>
	</div>
</div>

<script type="text/javascript">
$("#flexgrid").flexigrid({
                url : 'order/retrivebyparam?n=&c=&s=1',
                dataType : 'json',
				singleSelect : true,
                colModel : [ {
                    display : '订单编号',
                    name : 'orderid',
                    width : 100,
                    sortable : true,
                    align : 'center'
                    }, {
                        display : '订单创建人',
                        name : 'createperson',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '生成时间',
                        name : 'createtime',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '产品规格',
                        name : 'producttype',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '完美记忆套装',
                        name : 'memorysuit',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '所在城市',
                        name : 'city',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '额外选配馈赠礼盒',
                        name : 'dvdnum',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '成片和馈赠礼盒是否印制棕榈果标识',
                        name : 'isprint',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '用户姓名',
                        name : 'customername',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '用户手提',
                        name : 'customermobile',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '用户固话',
                        name : 'customerphone',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '用户电邮',
                        name : 'customeremail',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '用户地址',
                        name : 'customeraddress',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '宝贝父亲',
                        name : 'fathername',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '父亲手提',
                        name : 'fathermobile',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '宝贝母亲',
                        name : 'mothername',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '母亲手提',
                        name : 'mothermobile',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },  {
                        display : '宝贝姓名',
                        name : 'babyname',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },  {
                        display : '宝贝乳名',
                        name : 'babynickname',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },  {
                        display : '宝贝性别',
                        name : 'babysex',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },  {
                        display : '宝贝生日',
                        name : 'babybirthday',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '合计费用',
                        name : 'charge',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '第三方支付订单号',
                        name : 'thirdorderid',
                        width : 150,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '在线支付状态',
                        name : 'onlineorderstatus',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '线下支付状态',
                        name : 'offlineorderstatus',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '订单状态',
                        name : 'orderstatus',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }, {
                        display : '订单管理人',
                        name : 'ordermanager',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    },{
                        display : '影片管理',
                        name : 'filmmanager',
                        width : 100,
                        sortable : true,
                        align : 'center'
                    }],
                buttons : [ {
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
                    } ,
                    {
                        name : '详情',
                        bclass : 'detail',
                        onpress : staffmanager
                    }
                    ,
                    {
                        separator : true
                    } 
                ],
                usepager : true,
                title : '订单管理',
                useRp : true,
                rp : 50,
                showTableToggleBtn : true,
                width : '60%',
                height : 500
            });  
	
	function staffmanager(com, grid) {
                if (com == '新增') {
					$('#myModalLabel').text('新增订单');
                    $('#myModal').modal('toggle');
					
					$('#oid').attr("value","");
					$('#orderid').attr("value","");
							$('#producttype').attr("value","");
							$('#memorysuit').attr("value","");
							$('#city').attr("value","");
							$('#dvdnum').attr("value","");
							$('#isprint').attr("value","");
							$('#customername').attr("value","");
							$('#customermobile').attr("value","");
							$('#customerphone').attr("value","");
							$('#customeremail').attr("value","");
							$('#customeraddress').attr("value","");							
							$('#fathername').attr("value","");
							$('#fathermobile').attr("value","");
							$('#mothername').attr("value","");
							$('#mothermobile').attr("value","");
							$('#babyname').attr("value","");
							$('#babynickname').attr("value","");
							$('#babysex').attr("value","");
							$('#babybirthday').attr("value","");							
							$('#orderstatus').attr("value","");							
							$('#onlinestatus').attr("value","");
							$('#offlinestatus').attr("value","");
							$('#charge').attr("value","");
							$('#ordermanager').attr("value","");
							$('#submitdiv').css("display","block");
					
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
	        			url:"order/retrivebyid",
	        			type:"post",
						dataType : "json",
						data:{
							orderid:id
						},
	        			success:function(json)
	        			{
	        				$('#myModalLabel').text('编辑订单');
	        				$('#myModal').modal('toggle');

							$('#oid').attr("value",json.ID);
							$('#orderid').attr("value",json.ORDERID);
							$('#createperson').attr("value",json.CREATEPERSON);
							$('#producttype').attr("value",json.PRODUCTTYPE);
							$('#memorysuit').attr("value",json.MEMORYSUIT);
							$('#city').attr("value",json.CITY);
							$('#dvdnum').attr("value",json.DVDNUM);
							$('#isprint').attr("value",json.ISPRINT);
							$('#customername').attr("value",json.CUSTOMERNAME);
							$('#customermobile').attr("value",json.CUSTOMERMOBILE);
							$('#customerphone').attr("value",json.CUSTOMERPHONE);
							$('#customeremail').attr("value",json.CUSTOMEREMAIL);
							$('#customeraddress').attr("value",json.CUSTOMERADDRESS);							
							$('#fathername').attr("value",json.FATHERNAME);
							$('#fathermobile').attr("value",json.FATHERMOBILE);
							$('#mothername').attr("value",json.MOTHERNAME);
							$('#mothermobile').attr("value",json.MOTHERMOBILE);
							$('#babyname').attr("value",json.BABYNAME);
							$('#babynickname').attr("value",json.BABYNICKNAME);
							$('#babysex').attr("value",json.BABYSEX);
							$('#babybirthday').attr("value",json.BABYBIRTHDAY);							
							$('#orderstatus').attr("value",json.ORDERSTATUS);							
							$('#onlinestatus').attr("value",json.ONLINESTATUS);
							$('#offlinestatus').attr("value",json.OFFLINESTATUS);
							$('#charge').attr("value",json.CHARGE);
							$('#ordermanager').attr("value",json.ORDERMANAGER);
							$('#submitdiv').css("display","block");
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
			        			url:"order/delete",
			        			type:"post",
								data:{
									orderid:id
								},
			        			success:function(msg)
			        			{
			        				$('#flexgrid').flexOptions().flexReload();
			        			}
			        		});
	        			}
	        	}
                } else if (com == '详情') {
                   if ($('.trSelected', $('#flexgrid')).length == 0){  
	            alert("请选中一行");
	            return;
	        }else
	        	{
			        		id=$('.trSelected', $('#flexgrid')).attr("id").replace("row",""); 
	        		$.ajax({
	        			url:"order/retrivebyid",
	        			type:"post",
						dataType : "json",
						data:{
							orderid:id
						},
	        			success:function(json)
	        			{
	        				$('#myModalLabel').text('订单详情');
	        				$('#myModal').modal('toggle');
							
	        		$('#oid').attr("value",json.ID);
							$('#orderid').attr("value",json.ORDERID);
							$('#createtime').attr("value",json.GENERALTIME);
							$('#producttype').attr("value",json.PRODUCTTYPE);
							$('#memorysuit').attr("value",json.MEMORYSUIT);
							$('#city').attr("value",json.CITY);
							$('#dvdnum').attr("value",json.DVDNUM);
							$('#isprint').attr("value",json.ISPRINT);
							$('#customername').attr("value",json.CUSTOMERNAME);
							$('#customermobile').attr("value",json.CUSTOMERMOBILE);
							$('#customerphone').attr("value",json.CUSTOMERPHONE);
							$('#customeremail').attr("value",json.CUSTOMEREMAIL);
							$('#customeraddress').attr("value",json.CUSTOMERADDRESS);							
							$('#fathername').attr("value",json.FATHERNAME);
							$('#fathermobile').attr("value",json.FATHERMOBILE);
							$('#mothername').attr("value",json.MOTHERNAME);
							$('#mothermobile').attr("value",json.MOTHERMOBILE);
							$('#babyname').attr("value",json.BABYNAME);
							$('#babynickname').attr("value",json.BABYNICKNAME);
							$('#babysex').attr("value",json.BABYSEX);
							$('#babybirthday').attr("value",json.BABYBIRTHDAY);							
							$('#orderstatus').attr("value",json.ORDERSTATUS);							
							$('#onlinestatus').attr("value",json.ONLINESTATUS);
							$('#offlinestatus').attr("value",json.OFFLINESTATUS);
							$('#charge').attr("value",json.CHARGE);
							$('#ordermanager').attr("value",json.ORDERMANAGER);
							$('#submitdiv').css("display","block");
					$('#submitdiv').css("display","none");
	        			}
	        		});
	        	}
                }
            }
	function ordersubmit()
	{
		
		var un = $('#oid').val();
		var url = "order/create";
		if(un != "")
		{
			url = "order/update";
		}
		$.ajax({
			url : url,
			type:"post",
			data : {
				oid:un,
				orderid:$('#orderid').val(),
	        	createperson:$('#createperson').val(),
				memorysuit:$('#memorysuit').val(),
					producttype:$('#producttype').val(),
					city:$('#city').val(),
					dvdnum:$('#dvdnum').val(),
					isprint:$('#isprint').val(),
					customername:$('#customername').val(),
					customermobile:$('#customermobile').val(),
					customerphone:$('#customerphone').val(),
					customeremail:$('#customeremail').val(),
					customeraddress:$('#customeraddress').val(),
					fathername:$('#fathername').val(),
					fathermobile:$('#fathermobile').val(),
					mothername:$('#mothername').val(),
					mothermobile:$('#mothermobile').val(),
					babyname:$('#babyname').val(),
					babynickname:$('#babynickname').val(),
					babysex:$('#babysex').val(),
					babybirthday:$('#babybirthday').val(),
					orderstatus:$('#orderstatus').val(),					
					offlineorderstatus:$('#offlineorderstatus').val(),
					onlineorderstatus:$('#onlineorderstatus').val(),				
					charge:$('#charge').val(),	
					ordermanager:$('#ordermanager').val()					
			},
			success : function(msg) {
				$('#myModal').modal('hide');
				$('#flexgrid').flexOptions().flexReload();
			}
		});
		
	}
	
	function ordersearch()
	{
		var url = "order/retrivebyparam?n=" + $('#name').val() + "&c=" + $('#cperson').val() + "&s=" + $('#status').val();
		$('#flexgrid').flexOptions({url:url}).flexReload();
		
	}
	
	function generateorder()
	{
		var date = $('#babybirthday').val();
		var time="";
		if(date != null && date != "")
		{
			var dateArr = date.split("-");
			time = dateArr[0]+dateArr[1]+dateArr[2];
		}
		$('#orderid').attr("value",$('#babyname').val() + time);
	}
	
	
	function countprice()
	{
		var allprice = 0;
		 
		var ordertype = $("#producttype").val();
		var taozhuang = $("#memorysuit").val();
		var dvdcount = $("#dvdcount").val();
		var logoprint = $("#isprint").val();
		var count =  0 ;

		if(ordertype == "jizhi")
		{
			count += 15998;
		}
		else if(ordertype == "zunxiang")
		{
			count += 6288;
		}
		else if(ordertype == "diancang")
		{
			count += 3388;
		}
		if(taozhuang == "1")
		{
			count += 100;
			if(ordertype == 'jizhi')
			{
				count += 1360 - 2400;
			}else if(ordertype == 'zunxiang')
			{
				count += 566 - 629;
			}else if(ordertype == 'diancang')
			{
				count += 315 - 237;
			}
		}
		if(dvdcount != null && dvdcount != "")
			count += dvdcount * 65;
		if(logoprint == '0')
		{
			count += 200;
		}
		$('#charge').attr('value',count);
	}
	
	function filmmanager(orderid)
	{
		var src = "video?orderid=" + orderid;
		$("#maincontent",parent.document.body).load(src);
	}
	
	function compareonline()
	{
		var offline = $('#offlineorderstatus').val();
		var online = $('#onlineorderstatus').val();
		if(offline == 1 && online == 1 )
		{
			alert("在线支付状态和线下支付状态不能同时为支付");
			$("#offlineorderstatus option[value='2']").attr("selected",true);
		}
	}
</script>

