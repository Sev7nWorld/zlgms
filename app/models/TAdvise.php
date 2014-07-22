<?php

class TAdvise extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $ID;

    /**
     * @var string
     */
    public $TIME;

    /**
     * @var int
     */
    public $STATUS;

    /**
     * @var string
     */
    public $CONTENT;

    /**
     * @var string
     */
    public $NAME;
	
	/**
     * @var string
     */
    public $EMAIL;
	
	/**
     * @var string
     */
    public $MOBILE;
	
	/**
     * @var string
     */
    public $PHONE;

	/**
     * @var string
     */
    public $ADDRESS;
	
	/**
     * @var string
     */
    public $HOWTODEAL;
	
	public function getStatus()
	{
		if($this->STATUS == 1)
			$this->STATUS = "待处理";
		else if($this->STATUS == 2)
			$this->STATUS = "处理中";
		else
			$this->STATUS = "已处理";
		
		return $this->STATUS;
	}
}
