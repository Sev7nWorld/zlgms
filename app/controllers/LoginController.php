<?php

use Phalcon\Tag;
use Phalcon\Mvc\View as View;

class LoginController extends ControllerBase
{

    public function initialize()
    {
        Phalcon\Tag::setTitle('棕榈果后台管理系统');
        parent::initialize();
    }
	
    public function indexAction()
    {
		$username = $this->request->getPost('username');
		$pwd = $this->request->getPost('pwdbak');
		$checkcode = $this->request->getPost('checkcode');
		$re_code = $this->session->get('re_code');
		if(strtolower($checkcode) == strtolower($re_code))
		{
			$staff = TStaff::find("STAFFID='" . $username . "' and PASSWORD='" . $pwd . "'");
			if(count($staff) > 0)
			{
				$this->session->set('username',$username);
				$this->view->setVar('username',$username);
				$this->view->setTemplateAfter('main');
			}
			else
			{
				$this->view->setVar("error","uwpw");
				$this->flash->success('您输入的用户名或者密码有误，请重新输入！');
				return $this->forward('index');
			}
		}else
		{
			$this->view->setVar("error","cw");
			$this->flash->success('您输入的校验码有误，请重新输入！');
			return $this->forward('index');
		}
    }
	 public function logoutAction()
    {
		 $this->session->remove("username");
		 return $this->response->redirect("");
    }
}
