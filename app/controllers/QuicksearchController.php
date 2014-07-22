<?php
use Phalcon\Tag;
use Phalcon\Mvc\View as View;
class QuicksearchController extends ControllerBase
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
}
