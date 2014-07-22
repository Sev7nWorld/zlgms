<?php

use Phalcon\Tag;
use Phalcon\Mvc\View as View;
	
class VideoController extends ControllerBase
{

    public function initialize()
    {
		$this->view->setTemplateAfter('main');
        parent::initialize();
    }
	
    public function indexAction()
    {
		$orderid = $this->request->get('orderid');
		$this->view->setVar("orderid",$orderid);
		$this->view->setRenderLevel(View::LEVEL_BEFORE_TEMPLATE);
    }
	public function retrivebyparamAction()
    {
		$orderid = $this->request->get("orderid");
		
		$video = TVideo::find("ORDERID='".$orderid."'");
		
		$page = $this->request->getPost('page');
		$rp = $this->request->getPost('rp');
		$begin = ($page-1) * $rp;
		$jsonData = array('page'=>$page,'total'=>count($video),'rows'=>array());
		
		$result = TVideo::find("ORDERID='".$orderid."' limit ".$begin.",".$rp);
		foreach($result as $v)
		{
			$operation = "<a href='#' onclick='handlestatus(\"".$v->ID."\",1)'>发布</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='handlestatus(\"".$v->ID."\",2)'>隐藏</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='handlestatus(\"".$v->PAGEID."\",3)'>查看</a>";
			$dealprocess = "<a href='#' onclick='howtodeal(".$v->ID.")'>查看并处理</a>";
				
			$entry = array('id'=>$v->ID
					,'cell'=>array('videoname'=>$v->VIDEONAME
									,'videodate'=>$v->VIDEODATE
									,'videoaddr'=>$v->VIDEOADDR
									,'videostatus'=>$v->getStatus()
									,'isonline'=>$v->getOnline()
									,'directorname'=>$v->DIRECTORNAME
									,'youkuid'=>$v->YOUKUID
									,'youkupwd'=>$v->YOUKUPWD
									,'pageid'=>$v->PAGEID
									,'dealprocess'=>$dealprocess
									,'operation'=>$operation));
			$jsonData['rows'][] = $entry;
		}
		echo json_encode($jsonData);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	 public function retrivebyidAction()
    {
		$id = $this->request->getPost('id');
		$video = TVideo::findFirst("ID=".$id);
		echo json_encode($video);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	public function createAction()
    {	
		$videoname = $this->request->getPost('videoname');
		$videodate = $this->request->getPost('videodate');
		$videoaddr = $this->request->getPost('videoaddr');
		$videostatus = $this->request->getPost('videostatus');
		$orderid = $this->request->getPost('orderid');
		$youkuid = $this->request->getPost('youkuid');
		$youkupwd = $this->request->getPost('youkupwd');
		$pageid = $this->request->getPost('pageid');
		$directorname = $this->request->getPost('directorname');
		$isonline = $this->request->getPost('isonline');
		
		$imgfile = $_FILES['videopic'];
		$name=$imgfile['name'];  //取得图片名称
		$type=$imgfile['type']; //取得图片类型
		$size=$imgfile['size'];  //取得图片长度
		$tmpfile=$imgfile['tmp_name'];  //图片上传上来到临时文件的路径
		
		$imgfile1 = $_FILES['textpic'];
		$name1=$imgfile1['name'];  //取得图片名称
		$type1=$imgfile1['type']; //取得图片类型
		$size1=$imgfile1['size'];  //取得图片长度
		$tmpfile1=$imgfile1['tmp_name'];  //图片上传上来到临时文件的路径
		
		$video = new TVideo();
		$video->VIDEONAME = $videoname;
		$video->VIDEODATE = $videodate;
		$video->VIDEOADDR = $videoaddr;
		$video->VIDEOSTATUS = $videostatus;
		$video->ORDERID = $orderid;		
		$video->DIRECTORNAME = $directorname;
		$video->YOUKUID = $youkuid;
		$video->YOUKUPWD = $youkupwd;
		$video->ISONLINE = $isonline;
		$video->PAGEID = $pageid;
		
		if($tmpfile and is_uploaded_file($tmpfile))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file=fopen($tmpfile,"rb");
			$imgdata=bin2hex(fread($file,$size));
			fclose($file);
			$video->VIDEOPIC = $imgdata;		  
		}
		
		if($tmpfile1 and is_uploaded_file($tmpfile1))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file1=fopen($tmpfile1,"rb");
			$imgdata1=bin2hex(fread($file1,$size1));
			fclose($file1);
			$video->TEXTPIC = $imgdata1;		  
		}
		if ($video->save() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	public function updateAction()
    {
		$id = $this->request->getPost('id');
		$videoname = $this->request->getPost('videoname');
		$videodate = $this->request->getPost('videodate');
		$videoaddr = $this->request->getPost('videoaddr');
		$videostatus = $this->request->getPost('videostatus');
		$orderid = $this->request->getPost('orderid');
		$youkuid = $this->request->getPost('youkuid');
		$youkupwd = $this->request->getPost('youkupwd');
		$pageid = $this->request->getPost('pageid');
		$directorname = $this->request->getPost('directorname');
		$isonline = $this->request->getPost('isonline');
		
		$imgfile = $_FILES['videopic'];
		$name=$imgfile['name'];  //取得图片名称
		$type=$imgfile['type']; //取得图片类型
		$size=$imgfile['size'];  //取得图片长度
		$tmpfile=$imgfile['tmp_name'];  //图片上传上来到临时文件的路径
		
		$imgfile1 = $_FILES['textpic'];
		$name1=$imgfile1['name'];  //取得图片名称
		$type1=$imgfile1['type']; //取得图片类型
		$size1=$imgfile1['size'];  //取得图片长度
		$tmpfile1=$imgfile1['tmp_name'];  //图片上传上来到临时文件的路径
		
		$video = new TVideo();
		$video->ID = $id;
		$video->VIDEONAME = $videoname;
		$video->VIDEODATE = $videodate;
		$video->VIDEOADDR = $videoaddr;
		$video->VIDEOSTATUS = $videostatus;
		$video->ORDERID = $orderid;		
		$video->DIRECTORNAME = $directorname;
		$video->YOUKUID = $youkuid;
		$video->YOUKUPWD = $youkupwd;
		$video->ISONLINE = $isonline;
		$video->PAGEID = $pageid;
		
		if($tmpfile and is_uploaded_file($tmpfile))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file=fopen($tmpfile,"rb");
			$imgdata=bin2hex(fread($file,$size));
			fclose($file);
			$video->VIDEOPIC = $imgdata;		  
		}
		
		if($tmpfile1 and is_uploaded_file($tmpfile1))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file1=fopen($tmpfile1,"rb");
			$imgdata1=bin2hex(fread($file1,$size1));
			fclose($file1);
			$video->TEXTPIC = $imgdata1;		  
		}
		if ($video->update() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	 public function deleteAction()
    {
		$id = $this->request->getPost('id');
		$this->db->delete("t_video", "ID=".$id);
    }
	 public function publishAction()
    {
		$id = $this->request->getPost('id');
		$status = $this->request->getPost('status');
		
		$this->db->update("t_video",array("ISONLINE"),array($status),"ID=".$id);
    }
	public function dealsearchAction()
    {
		$id = $this->request->getPost('aid');
		$video = TVideo::findFirst("ID=".$id);

		echo $video->DEALPROCESS;
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	public function dealAction()
    {
		$id = $this->request->getPost('aid');
		$c = $this->request->getPost('content');
		
		$video = TVideo::findFirst("ID=".$id);
		
		$createtime = date('Y-m-d H:i:s',time());
		$content = $video->DEALPROCESS."		".$createtime.":".$c;
		
		$this->db->update("t_video",array("DEALPROCESS"),array($content),"ID=".$id);
    }
}
