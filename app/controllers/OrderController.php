<?php

use Phalcon\Tag;
use Phalcon\Mvc\View as View;

class OrderController extends ControllerBase
{

    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Phalcon\Tag::setTitle('订单管理');
        parent::initialize();
    }
	
    public function indexAction()
    {
       $this->view->setRenderLevel(View::LEVEL_BEFORE_TEMPLATE);
	   $this->view->setVar("username",$this->session->get('username'));
    }
	
	public function retrivebyparamAction()
    {
		$name = $this->request->get("n");
		$createperson = $this->request->get("c");
		$status = $this->request->get("s");
		$flag = $this->request->get("f");
		
		$where = "DELETESTATUS=1";
		if($flag != null && $flag != "")
		{
			if($flag == "0")
				$where = "DELETESTATUS=0";
		}
		
		if($createperson != "")
			$where = $where." and ORDERMANAGER like '%".$createperson."%'";
		if($name != "")
			$where = $where." and BABYNAME like '%".$name."%'";
		if($status != "4")
			$where = $where." and ORDERSTATUS=".$status;
		
		$order = TOrder::find($where);
		
		$page = $this->request->getPost('page');
		$rp = $this->request->getPost('rp');
		$begin = ($page-1) * $rp;
		$jsonData = array('page'=>$page,'total'=>count($order),'rows'=>array());
		
		$result = TOrder::find($where." limit ".$begin.",".$rp);
		foreach($result as $o)
		{
			$operation = "<a href='#' onclick='filmmanager(".$o->ID.")'>操作</a>";
			
			$entry = array('id'=>$o->ID,'cell'=>array('orderid'=>$o->ORDERID,'createperson'=>$o->CREATEPERSON
			,'createtime'=>$o->GENERALTIME,'producttype'=>$o->getProductType()
			,'memorysuit'=>$o->getMemorySuit(),'city'=>$o->CITY,'dvdnum'=>$o->DVDNUM
			,'isprint'=>$o->getPrint(),'customername'=>$o->CUSTOMERNAME,'customermobile'=>$o->CUSTOMERMOBILE
			,'customerphone'=>$o->CUSTOMERPHONE,'customeremail'=>$o->CUSTOMEREMAIL,'customeraddress'=>$o->CUSTOMERADDRESS
			,'fathername'=>$o->FATHERNAME,'fathermobile'=>$o->FATHERMOBILE,'mothername'=>$o->MOTHERNAME,'mothermobile'=>$o->MOTHERMOBILE
			,'orderstatus'=>$o->getOrderStatus(),'babyname'=>$o->BABYNAME,'babynickname'=>$o->BABYNICKNAME,'babysex'=>$o->BABYSEX,'babybirthday'=>$o->BABYBIRTHDAY
			,'offlineorderstatus'=>$o->getOfflineStatus(),'onlineorderstatus'=>$o->getOnlineStatus(),'ordermanager'=>$o->ORDERMANAGER
			,'thirdorderid'=>$o->THIRDORDERID,'charge'=>$o->CHARGE,'filmmanager'=>$operation));
			$jsonData['rows'][] = $entry;
		}
		echo json_encode($jsonData);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	 public function retrivebyidAction()
    {
		$id = $this->request->getPost('orderid');
		$order = TOrder::findFirst("ID=".$id);
		echo json_encode($order);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	
	public function createAction()
    {

		$createtime = date('Y-m-d H:i:s',time());

		$orderid = $this->request->getPost('orderid');
		$createperson = $this->session->get('username');
		$memorysuit = $this->request->getPost('memorysuit');
		$producttype = $this->request->getPost('producttype');
		$city = $this->request->getPost('city');		
		$dvdnum = $this->request->getPost('dvdnum');
		$isprint = $this->request->getPost('isprint');
		$customername = $this->request->getPost('customername');
		$customermobile = $this->request->getPost('customermobile');
		$customerphone = $this->request->getPost('customerphone');		
		$customeremail = $this->request->getPost('customeremail');
		$customeraddress = $this->request->getPost('customeraddress');
		$fathername = $this->request->getPost('fathername');
		$fathermobile = $this->request->getPost('fathermobile');
		$mothername = $this->request->getPost('mothername');	
		$mothermobile = $this->request->getPost('mothermobile');
		$orderstatus = $this->request->getPost('orderstatus');
		$babyname = $this->request->getPost('babyname');
		$babynickname = $this->request->getPost('babynickname');
		$babysex = $this->request->getPost('babysex');		
		$babybirthday = $this->request->getPost('babybirthday');
		$offlineorderstatus = $this->request->getPost('offlineorderstatus');
		$onlineorderstatus = $this->request->getPost('onlineorderstatus');
		$charge = $this->request->getPost('charge');
		$ordermanager = $this->request->getPost('ordermanager');
		
		$order = new TOrder();
		$order->ORDERID = $orderid;
		$order->CREATEPERSON = $createperson;
		$order->GENERALTIME = $createtime;
		$order->PRODUCTTYPE = $producttype;
		$order->MEMORYSUIT = $memorysuit;
		$order->CITY = $city;
		$order->DVDNUM = $dvdnum;
		$order->ISPRINT = $isprint;
		$order->CUSTOMERNAME = $customername;
		$order->CUSTOMERMOBILE = $customermobile;
		$order->CUSTOMERPHONE = $customerphone;
		$order->CUSTOMEREMAIL = $customeremail;
		$order->CUSTOMERADDRESS = $customeraddress;
		$order->FATHERNAME = $fathername;
		$order->FATHERMOBILE = $fathermobile;
		$order->MOTHERNAME = $mothername;
		$order->MOTHERMOBILE = $mothermobile;
		$order->BABYNAME = $babyname;
		$order->BABYNICKNAME = $babynickname;
		$order->BABYSEX = $babysex;
		$order->ORDERSTATUS = $orderstatus;
		$order->ONLINESTATUS = $onlineorderstatus;
		$order->OFFLINESTATUS = $offlineorderstatus;
		$order->CHARGE = $charge;
		$order->ORDERMANAGER = $ordermanager;
		$order->THIRDORDERID = "";
		$order->DELETESTATUS = 1;
		
		if ($order->save() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	public function updateAction()
    {
		$createtime = date('Y-m-d H:i:s',time());
		$id = $this->request->getPost('oid');
		$orderid = $this->request->getPost('orderid');
		$createperson = $this->session->get('username');
		$memorysuit = $this->request->getPost('memorysuit');
		$producttype = $this->request->getPost('producttype');
		$city = $this->request->getPost('city');		
		$dvdnum = $this->request->getPost('dvdnum');
		$isprint = $this->request->getPost('isprint');
		$customername = $this->request->getPost('customername');
		$customermobile = $this->request->getPost('customermobile');
		$customerphone = $this->request->getPost('customerphone');		
		$customeremail = $this->request->getPost('customeremail');
		$customeraddress = $this->request->getPost('customeraddress');
		$fathername = $this->request->getPost('fathername');
		$fathermobile = $this->request->getPost('fathermobile');
		$mothername = $this->request->getPost('mothername');	
		$mothermobile = $this->request->getPost('mothermobile');
		$orderstatus = $this->request->getPost('orderstatus');
		$babyname = $this->request->getPost('babyname');
		$babynickname = $this->request->getPost('babynickname');
		$babysex = $this->request->getPost('babysex');		
		$babybirthday = $this->request->getPost('babybirthday');
		$offlineorderstatus = $this->request->getPost('offlineorderstatus');
		$onlineorderstatus = $this->request->getPost('onlineorderstatus');
		$charge = $this->request->getPost('charge');
		$ordermanager = $this->request->getPost('ordermanager');
		
		$order = new TOrder();
		$order->ID = $id;
		$order->ORDERID = $orderid;
		$order->CREATEPERSON = $createperson;
		$order->GENERALTIME = $createtime;
		$order->PRODUCTTYPE = $producttype;
		$order->MEMORYSUIT = $memorysuit;
		$order->CITY = $city;
		$order->DVDNUM = $dvdnum;
		$order->ISPRINT = $isprint;
		$order->CUSTOMERNAME = $customername;
		$order->CUSTOMERMOBILE = $customermobile;
		$order->CUSTOMERPHONE = $customerphone;
		$order->CUSTOMEREMAIL = $customeremail;
		$order->CUSTOMERADDRESS = $customeraddress;
		$order->FATHERNAME = $fathername;
		$order->FATHERMOBILE = $fathermobile;
		$order->MOTHERNAME = $mothername;
		$order->MOTHERMOBILE = $mothermobile;
		$order->BABYNAME = $babyname;
		$order->BABYNICKNAME = $babynickname;
		$order->BABYSEX = $babysex;
		$order->ORDERSTATUS = $orderstatus;
		$order->ONLINESTATUS = $onlineorderstatus;
		$order->OFFLINESTATUS = $offlineorderstatus;
		$order->CHARGE = $charge;
		$order->ORDERMANAGER = $ordermanager;
		$order->THIRDORDERID = "";
		$order->DELETESTATUS = 1;
		if ($order->update() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	
	 public function deleteAction()
    {
		$id = $this->request->getPost('orderid');
		$this->db->update("t_order",array("DELETESTATUS"),array(0),"ID=".$id);
    }
	 public function destroyAction()
    {
		$id = $this->request->getPost('orderid');
		$this->db->delete("t_order", "ID=".$id);
    }
	 public function backAction()
    {
		$id = $this->request->getPost('orderid');
		$this->db->update("t_order",array("DELETESTATUS"),array(1),"ID=".$id);
    }
	public function recycleAction()
    {
		 $this->view->setRenderLevel(View::LEVEL_BEFORE_TEMPLATE);
    }
	
}
