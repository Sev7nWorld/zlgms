<?php
use Phalcon\Tag;
use Phalcon\Mvc\View as View;

class StaffController extends ControllerBase
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
	public function retrivebyparamAction()
    {
		$name = $this->request->get("name");
		$status = $this->request->get("s");
		
		$where = "1=1";
		if($name != "")
			$where = $where." and STAFFID like '%".$name."%'";
		if($status != "0")
			$where = $where." and STAFFTYPE=".$status;

		$staff = TStaff::find($where);

		$page = $this->request->getPost('page');
		$rp = $this->request->getPost('rp');
		$begin = ($page-1) * $rp;
		$jsonData = array('page'=>$page,'total'=>count($staff),'rows'=>array());
		
		$result = TStaff::find($where." limit ".$begin.",".$rp);
		foreach($result as $s)
		{
			$entry = array('id'=>$s->STAFFID
					,'cell'=>array('staffid'=>$s->STAFFID
									,'password'=>$s->PASSWORD
									,'staffemail'=>$s->STAFFEMAIL
									,'type'=>$s->getType()
									,'mobile'=>$s->MOBILE
									,'city'=>$s->getCity()));
			$jsonData['rows'][] = $entry;
		}
		echo json_encode($jsonData);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	 public function retrivebyidAction()
    {
		$id = $this->request->getPost('staffID');
		$staff = TStaff::findFirst("STAFFID='".$id."'");
		echo json_encode($staff);
		$this->view->setRenderLevel(View::LEVEL_NO_RENDER);
    }
	public function createAction()
    {
		$staffID = $this->request->getPost('username');
		$password =  $this->request->getPost('password');
		$email =  $this->request->getPost('email');
		$mobile =  $this->request->getPost('mobile');
		$city =  $this->request->getPost('city');
		$type =  $this->request->getPost('type');
		
		$staff = new TStaff();
		$staff->STAFFID = $staffID;
		$staff->PASSWORD = $password;
		$staff->STAFFEMAIL = $email;
		$staff->STAFFTYPE = $type;
		$staff->MOBILE = $mobile;
		$staff->CITY = $city;
		
		if ($staff->save() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	public function updateAction()
    {
		$id = $this->request->getPost('id');
		$staffID = $this->request->getPost('username');
		$password =  $this->request->getPost('password');
		$email =  $this->request->getPost('email');
		$mobile =  $this->request->getPost('mobile');
		$city =  $this->request->getPost('city');
		$type =  $this->request->getPost('type');
		
		$staff = new TStaff();
		$staff->ID = $id;
		$staff->STAFFID = $staffID;
		$staff->PASSWORD = $password;
		$staff->STAFFEMAIL = $email;
		$staff->STAFFTYPE = $type;
		$staff->MOBILE = $mobile;
		$staff->CITY = $city;
		
		if ($staff->update() == false) {
			foreach ($robot->getMessages() as $message) {
				echo $message;
			}
		}
    }
	 public function deleteAction()
    {
		$id = $this->request->getPost('staffID');
		$this->db->delete("t_staff", "STAFFID='".$id."'");
    }
}
