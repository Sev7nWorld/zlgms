<?php

class TDemopage extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $ID;

    /**
     * @var string
     */
    public $VIDEONAME;

    /**
     * @var int
     */
    public $VIDEODATE;

    /**
     * @var string
     */
    public $VIDEOADDR;

    /**
     * @var string
     */
    public $VIDEOID;
	
	/**
     * @var string
     */
    public $PIC;
	
	/**
     * @var string
     */
    public $TEXTPIC;
	
	/**
     * @var string
     */
    public $WEBPAGEID;

	/**
     * @var string
     */
    public $VIDEOSTATUS;
	
	
	public function getStatus()
	{
		if($this->VIDEOSTATUS == 1)
			$this->VIDEOSTATUS = "已发布";
		else if($this->VIDEOSTATUS == 2)
			$this->VIDEOSTATUS = "未发布";
		
		return $this->VIDEOSTATUS;
	}
}
