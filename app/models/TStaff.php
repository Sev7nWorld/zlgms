<?php

class TStaff extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $ID;
	
	/**
     * @var string
     */
    public $STAFFID;

    /**
     * @var string
     */
    public $PASSWORD;

    /**
     * @var int
     */
    public $STAFFTYPE;

    /**
     * @var string
     */
    public $STAFFEMAIL;

    /**
     * @var string
     */
    public $CITY;
	
	/**
     * @var string
     */
    public $MOBILE;
	
	public function getType()
	{
		if($this->STAFFTYPE == 1)
			$this->STAFFTYPE = "超级管理员";
		else if($this->STAFFTYPE == 2)
			$this->STAFFTYPE = "管理员";
		
		return $this->STAFFTYPE;
	}
	public function getCity()
	{
		if($this->CITY == "1")
			$this->CITY = "北京";
		elseif($this->CITY == "2")
			$this->CITY = "上海";
		elseif($this->CITY == "3")
			$this->CITY = "广州";
		elseif($this->CITY == "4")
			$this->CITY = "深圳";
		elseif($this->CITY == "5")
			$this->CITY = "杭州";
		elseif($this->CITY == "6")
			$this->CITY = "重庆";
		elseif($this->CITY == "7")
			$this->CITY = "天津";
		elseif($this->CITY == "8")
			$this->CITY = "长春";
		else
			$this->CITY = "成都";
		
		return $this->CITY;
	}
}
