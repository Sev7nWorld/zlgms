<?php

use Phalcon\Tag;
use Phalcon\Mvc\View as View;
	
class AdviseController extends ControllerBase
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
	public function searchAction()
    {
		$flag = $this->request->get("f");
		$advise = TAdvise::find("STATUS=".$flag." order by TIME desc");
		
		$page = $this->request->getPost('page');
		$rp = $this->request->getPost('rp');
		$begin = ($page-1) * $rp;
		$jsonData = array('page'=>$page,'total'=>count($advise),'rows'=>array());
		
		$result = TAdvise::find("STATUS=".$flag." order by TIME desc"." limit ".$begin.",".$rp);
		foreach($result as $a)
		{
			$status = "";
			$operation = "";
			if($a->STATUS == 1)
			{
				$status = "待处理";		
			}
			elseif($a->STATUS == 2)
			{
				$status = "处理中";
			}
			elseif($a->STATUS == 3)
			{
				$status = "已处理";
			}
			$operation = "<a href='#' onclick='handleadvise(".$a->ID.",1)'>待处理</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='handleadvise(".$a->ID.",2)'>处理中</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onclick='handleadvise(".$a->ID.",3)'>已处理</a>";
			$howtodeal = "<a href='javascript:void(0)' onclick='howtodeal(".$a->ID.")'>查看并处理</a>";
			$entry = array('id'=>$a->ID
						,'cell'=>array('aid'=>$a->ID
										,'time'=>$a->TIME
										,'status'=>$status
										,'content'=>$a->CONTENT
										,'name'=>$a->NAME
										,'email'=>$a->EMAIL
										,'mobile'=>$a->MOBILE
										,'phone'=>$a->PHONE
										,'address'=>$a->ADDRESS
										,'operation'=>$operation
										,'howtodeal'=>$howtodeal));
			$jsonData['rows'][] = $entry;
		}
		echo json_encode($jsonData);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	 public function deleteAction()
    {
		$id = $this->request->getPost('id');
		$flag = $this->request->getPost('flag');
		$status = $this->request->getPost('status');
		
		if($flag == 2)
			$this->db->delete("t_advise", "STATUS=".$status);
		else
			$this->db->delete("t_advise", "ID=".$id);
    }
	 public function handleAction()
    {
		$id = $this->request->getPost('id');
		$flag = $this->request->getPost('flag');
		
		$this->db->update("t_advise",array("STATUS"),array($flag),"ID=".$id);
    }
	public function dealsearchAction()
    {
		$id = $this->request->getPost('aid');
		$advise = TAdvise::findFirst("ID=".$id);

		echo $advise->HOWTODEAL;
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	public function dealAction()
    {
		$id = $this->request->getPost('aid');
		$c = $this->request->getPost('content');
		
		$advise = TAdvise::findFirst("ID=".$id);		
		$createtime = date('Y-m-d H:i:s',time());
		$content = $advise->HOWTODEAL."		".$createtime.":".$c;
		
		$this->db->update("t_advise",array("HOWTODEAL"),array($content),"ID=".$id);
    }
}
