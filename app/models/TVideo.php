<?php

class TVideo extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $ID;

    /**
     * @var string
     */
    public $ORDERID;

    /**
     * @var int
     */
    public $VIDEONAME;

    /**
     * @var string
     */
    public $DIRECTORNAME;

    /**
     * @var string
     */
    public $VIDEODATE;
	
	/**
     * @var string
     */
    public $VIDEOADDR;
	
	/**
     * @var string
     */
    public $STATUS;
	
	/**
     * @var string
     */
    public $PAGEID;

	/**
     * @var string
     */
    public $ISONLINE;
	public $YOUKUID;
	public $YOUKUPWD;
	public $DEALPROCESS;
	public $TEXTPIC;
	public $VIDEOPIC;
	
	
	public function getStatus()
	{
		if($this->STATUS == 1)
			$this->STATUS = "制作中";
		else
			$this->STATUS = "已完成";
		
		return $this->STATUS;
	}
	
	public function getOnline()
	{
		if($this->ISONLINE == 1)
			$this->ISONLINE = "发布状态";
		else
			$this->ISONLINE = "隐藏状态";
		
		return $this->ISONLINE;
	}
}
