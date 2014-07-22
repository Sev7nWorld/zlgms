<?php

class RestController extends Phalcon\Mvc\Controller 
{

	public function indexAction()
	{

	}
	
	public function testAction()
	{
		$request = $this->request;
		$username = $request->get("username");
		$this->view->setRenderLevel(Phalcon\Mvc\View::LEVEL_NO_RENDER);
		echo json_encode($username);
	}
	public function testgetAction()
	{

	}
}
