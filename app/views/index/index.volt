<script type="text/javascript">
var flag = 0;
function testcode(e)
	{
		var value = e.value;
		
		if(value.length == 4)
		{
		$.ajax({
			url:"code/check",
			type : "post",
			dataType : "json",
			data : {
				checkcode : $('#checkcode').val()
			},
			success : function(msg) {
					if(msg=='1')
						{
						$("#" + e.id).css("background","url(img/yes.jpg) no-repeat right");
						flag = 1;
						}else
						{
							$("#" + e.id).css("background","url(img/no.jpg) no-repeat right");
							flag = 0;
						}
							
						
				}
		});
		}
		
	}
function freshcode()
{
	$('#checkcodeimg').attr('src','code?t=' + Math.random());
}

function submitfun()
{
	
		$('#loginform').submit();
		
}

function showTip()
{
	$('#myModal').modal('show');
}

function shutTip()
{
	$('#myModal').modal('hide');
}


</script>

<div id="login">
	<div id="login-top">	
		<img src="img/zlg_logo_white_ad_1600_400.png" id="logo" style="margin-left:-4px;width:200px"/>
		<div id="login-content">
			<form id="loginform" action="login" method="post">
				<p>
					<input class="text-input" type="text" name="username" onFocus="if(value==defaultValue){value='';this.style.color='#6699cc'}" onBlur="if(!value){value=defaultValue;this.style.color='#6699cc';}" value="用户名" style="height:22px;line-height:22px;" />
				</p>
				<p>
					<input id="txtpwd" class="text-input" value="密码" type="text" name="password" style="height:22px;line-height:22px;"/>
					<input name="pwdbak" type="password" class="text-input" style="display:none;height:22px;line-height:22px;" id="pwd"/>
				</p>
				<p style="margin-left:2px;">
					<input id="checkcode" name="checkcode" class="text-input" type="text" onFocus="if(value==defaultValue){value='';this.style.color='#6699cc';testcode(this)}" onBlur="if(!value){value=defaultValue;this.style.color='#6699cc';}" value="验证码" style="width:56px;height:22px;line-height:22px;margin-left:-95px; " maxlength="4" onkeyup="testcode(this)" />
					<img id="checkcodeimg" src="code" style=" position:absolute;width:58px;height:31px; margin-top:-1px; margin-left:7px;" />
					<input type="button" id="freshbtn" onclick="freshcode()" style="margin-left:70px;"/>
				</p>
				<p>
                    <input id="submitbtn" class="submitbtn" type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" onClick="submitfun()" style="margin-left:100px; height:30px; line-height:30px; width:70px; margin-top:-3px;"  />
                </p>
				<p style="margin-left:120px; margin-top:10px;">
                    <input id="showtipid" class="submitbtn" type="button" value="安全提示" onClick="showTip()" style="margin-left:-18px; height:30px; line-height:30px; width:70px;margin-top:6px;"  />
				</p>
				<p style="margin-left:120px; margin-top:10px;">
                   {{content()}}
				</p>
			</form>
		</div>
	</div>
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="color:#ffffff">
		<div class="modal-header">
			<h2 id="myModalLabel" style="font-weight:bold">安全提示</h2>
		</div>
	<div class="modal-body">
		<br/>
		<p>为了保证管理系统安全和您的帐号安全，请您登录时尽量按照如下要求进行操作：</p>
		<p>
			<ul style="list-style:disc; margin-left:12px;">
				<li >
					操作系统安全：
					<p>建议：</p><p style="margin-left:37px;">1.请您尽量使用安装有正版操作系统的电脑或移动设备登录。</p>
					<p style="margin-left:37px;">2.建议使用：苹果OS X（苹果电脑所预装的）系统或iOS（iPhone和iPad所预装的）系统。因为苹果OS X和iOS系统的封闭性特点，任何没有被破解系统的苹果设备都是安全的，您可以在任何没有被破解系统的苹果Mac电脑、iPhone或iPad上放心登录。</p>
					<p>禁止：</p><p style="margin-left:37px;">1.来路不明的破解版操作系统很可能默认就已经含有木马程序，所以强烈建议您尽量避免在安装了破解版操作系统的电脑或移动设备上登录。</p>
					<p style="margin-left:37px;">2.不建议使用：不建议您使用微软Windows系统。除了预装有正版微软Windows操作系统的品牌电脑外，多数安装有Windows操作系统的电脑使用的都是破解版的非正版系统，因此建议您尽量不要使用此类装有破解版Windows系统的电脑登录。</p>
					<p style="margin-left:37px;">3.不建议使用：不建议您使用谷歌Android系统（安卓系统）。因为谷歌Android系统的权限设置特点，任何您已经安装的安卓应用程序都能够轻易的获取您手机内的数据，强烈建议您不要使用任何Android设备进行登录。</p>
				</li>
				<li>
					网络环境安全：
					<p>建议：</p><p style="margin-left:37px;">1.只要您进行了登录操作，您所处于的网络环境的管理者就有可能获取您的所有登录信息。因此建议您尽量在安全的网络环境下进行登录，例如您的家中，或者其他您能够确认安全的网络环境。</p>
					<p>禁止：</p><p style="margin-left:37px;">1.可能不安全的网络环境包括但不限于：网吧，咖啡厅茶室等商户WiFi，商业公司或社会机构的办公室网络。</p>
				</li>
				<li>
					电脑防火墙安全：
					<p>建议：</p><p style="margin-left:37px;">1.如果您使用电脑登录，请您尽量使用国际知名公司的防火墙产品。</p>
					<p style="margin-left:37px;">2.如果您缺乏电脑防火墙的相关知识，请您直接使用“LooknStop”防火墙，并保证安装程序是从其官网下载的。LooknStop安全的安装程序下载地址：http://www.looknstop.com</p>
					<p style="margin-left:37px;">3.因为系统内核的权限设置特点，苹果公司的电脑和移动设备无需安装防火墙。</p>
					<p>禁止:</p><p style="margin-left:37px;">1.诸多中国大陆IT公司的防火墙产品被证明不仅会收集和记录用户的互联网浏览数据，而且会扫描用户的硬盘数据，并且会利用其防火墙预留的后门上传用户的硬盘数据到其服务器。多数中国大陆IT公司制作的杀毒软件也会进行以上类似操作。</p>
				</li>
				<li>
					浏览器安全：
					<p>建议：</p><p style="margin-left:37px;">1.如果您使用电脑登录，请您尽量使用Chrome、Safari、Firefox或者较高版本的IE浏览器进行登录。</p>
					<p style="margin-left:37px;">2.如果您选择使用以上推荐的电脑浏览器，请从对应公司的官方网站下载安装程序，因为来路不明的非官方的安装程序版本很可能被进行了不安全的修改。同时，请尽量保证您所使用的浏览器不含有来路不明的插件。在您每次登录退出之后，您可以手动清除浏览器保存的历史记录和Cookie信息。</p>
					 <p style="margin-left:37px;">3.如果您使用移动设备登录，请尽量使用非破解版移动设备系统自带的浏览器登录。</p>
					<p>禁止：</p><p style="margin-left:37px;"></p><p style="margin-left:37px;">1.请您一定不要使用已经被证明会收集用户信息的电脑浏览器，此类不建议使用的电脑浏览器包括但不限于：360浏览器，QQ浏览器，搜狗浏览器，傲游浏览器，猎豹浏览器。<a</p>
					<p style="margin-left:37px;">2.建议您不要使用任何中国大陆公司制作的移动设备浏览器（UC浏览器等）。</p>
				</li>
				<li>
					输入法安全：
					<p>建议：</p><p style="margin-left:37px;">1.在登录过程中输入帐号和密码时，建议您尽量使用操作系统自带的默认输入法。</p>
					<p>禁止:</p><p style="margin-left:37px;">1.请您尽量不要使用从网络下载安装的输入法，尤其不要使用那些会上传您所有输入文本数据的“网络输入法”或“云输入法”，强烈建议您不要使用任何中国大陆公司制作的输入法。建议您不要使用的输入法包括但不限于：搜狗输入法，百度输入法，QQ输入法。</p>
				</li>
				<li>
					密码安全：
					<p>建议：</p><p style="margin-left:37px;">1.建议您将密码牢记于心，不要将密码以任何形式保存于电脑中或网络上。</p>
					<p style="margin-left:37px;">2.建议您每隔6个月至少更换一次密码。</p>
					<p>禁止：</p><p style="margin-left:37px;">1.请不要将密码以任何形式保存于电脑中或网络上。</p>
					<p style="margin-left:37px;">2.请不要将密码告知他人。</p>
				</li>
			</ul>
		</p>
	</div>
	<div class="modal-footer" style="border:1px;">
		<input id="showtipid" class="submitbtn" type="button" value="关&nbsp;&nbsp;&nbsp;闭" onClick="shutTip()" style="margin-left:-18px; height:30px; line-height:30px; width:70px;margin-top:6px;"  />
	</div>
</div>

<script>
	var txtpwd = document.getElementById("txtpwd"), pwd = document.getElementById("pwd");
   txtpwd.onfocus = function(){
   if(this.value != "密码") return;
   this.style.display = "none";
   pwd.style.display = "";
   pwd.value = "";
   pwd.focus();
 }
  pwd.onblur = function() {
   if(this.value != "") return;
   this.style.display = "none";
   txtpwd.style.display = "";
   txtpwd.value = "密码";
 }
</script>

