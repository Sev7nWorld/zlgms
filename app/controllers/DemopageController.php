<?php

use Phalcon\Tag;
use Phalcon\Mvc\View as View;
	
class DemopageController extends ControllerBase
{

    public function initialize()
    {
		$this->view->setTemplateAfter('main');
        parent::initialize();
    }
	
    public function indexAction()
    {
		$this->view->setRenderLevel(View::LEVEL_BEFORE_TEMPLATE);
    }
	public function searchbyparamAction()
    {
		$name = $this->request->get("name");
		$status = $this->request->get("s");
		
		$where = "1=1";
		if($name != "")
			$where = $where." and VIDEONAME like '%".$name."%'";
		if($status != "0")
			$where = $where." and VIDEOSTATUS=".$status;
		$demo = TDemopage::find($where);
		
		$page = $this->request->getPost('page');
		$rp = $this->request->getPost('rp');
		$begin = ($page-1) * $rp;
		$jsonData = array('page'=>$page,'total'=>count($demo),'rows'=>array());
		
		$result = TDemopage::find($where." limit ".$begin.",".$rp);
		foreach($result as $d)
		{
			$operation = "<a href='#' onclick='handlestatus(".$d->ID.",1)'>发布</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='handlestatus(".$d->ID.",2)'>隐藏</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='handlestatus(".$d->ID.",3)'>查看</a>";
			
			$entry = array('id'=>$d->ID
					,'cell'=>array('videoname'=>$d->VIDEONAME
									,'videodate'=>$d->VIDEODATE
									,'videoaddr'=>$d->VIDEOADDR
									,'videostatus'=>$d->getStatus()
									,'videoid'=>$d->VIDEOID
									,'operation'=>$operation));
			$jsonData['rows'][] = $entry;
		}
		echo json_encode($jsonData);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	 public function searchbyidAction()
    {
		$id = $this->request->getPost('id');
		$demo = TDemopage::findFirst("ID=".$id);
		echo json_encode($demo);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	public function createAction()
    {
		$videoname = $this->request->getPost('videoname');
		$videodate = $this->request->getPost('videodate');
		$videoaddr = $this->request->getPost('videoaddr');
		$videostatus = $this->request->getPost('videostatus');
		$videoid = $this->request->getPost('videoid');
		
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
		
		$demo = new TDemopage();
		$demo->VIDEONAME = $videoname;
		$demo->VIDEODATE = $videodate;
		$demo->VIDEOADDR = $videoaddr;
		$demo->VIDEOSTATUS = $videostatus;
		$demo->VIDEOID = $videoid;
		
		if($tmpfile and is_uploaded_file($tmpfile))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file=fopen($tmpfile,"rb");
			$imgdata=bin2hex(fread($file,$size));
			fclose($file);
			$demo->PIC = $imgdata;		  
		}
		
		if($tmpfile1 and is_uploaded_file($tmpfile1))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file1=fopen($tmpfile1,"rb");
			$imgdata1=bin2hex(fread($file1,$size1));
			fclose($file1);
			$demo->TEXTPIC = $imgdata1;		  
		}
		if ($demo->save() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	public function updateAction()
    {
		$demopageid = $this->request->getPost('id');
		$videoname = $this->request->getPost('videoname');
		$videodate = $this->request->getPost('videodate');
		$videoaddr = $this->request->getPost('videoaddr');
		$videostatus = $this->request->getPost('videostatus');
		$videoid = $this->request->getPost('videoid');
		
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
		
		$demo = new TDemopage();
		$demo->ID = $demopageid;
		$demo->VIDEONAME = $videoname;
		$demo->VIDEODATE = $videodate;
		$demo->VIDEOADDR = $videoaddr;
		$demo->VIDEOSTATUS = $videostatus;
		$demo->VIDEOID = $videoid;
		
		if($tmpfile and is_uploaded_file($tmpfile))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file=fopen($tmpfile,"rb");
			$imgdata=bin2hex(fread($file,$size));
			fclose($file);
			$demo->PIC = $imgdata;		  
		}
		
		if($tmpfile1 and is_uploaded_file($tmpfile1))  //判断上传文件是否为空，文件是不是上传的文件
		{
			   //读取图片流
			$file1=fopen($tmpfile1,"rb");
			$imgdata1=bin2hex(fread($file1,$size1));
			fclose($file1);
			$demo->TEXTPIC = $imgdata1;		  
		}
		if ($demo->update() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	 public function deleteAction()
    {
		$id = $this->request->getPost('id');
		$this->db->delete("t_demopage", "ID=".$id);
    }
	 public function dealAction()
    {
		$id = $this->request->getPost('id');
		$status = $this->request->getPost('status');
		
		$this->db->update("t_demopage",array("VIDEOSTATUS"),array($status),"ID=".$id);
    }
}
