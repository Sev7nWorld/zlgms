<?php

class TOrder extends Phalcon\Mvc\Model
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
     * @var string
     */
    public $CREATEPERSON;

    /**
     * @var int
     */
    public $GENERALTIME;

    /**
     * @var string
     */
    public $PRODUCTTYPE;

    /**
     * @var string
     */
    public $MEMORYSUIT;
	
	/**
     * @var string
     */
    public $CITY;
	public $DVDNUM;
	public $ISPRINT;
	public $CUSTOMERNAME;
	public $CUSTOMERMOBILE;
	public $CUSTOMERPHONE;
	public $CUSTOMEREMAIL;
	public $CUSTOMERADDRESS;
	public $FATHERNAME;
	public $FATHERMOBILE;
	public $MOTHERNAME;
	public $MOTHERMOBILE;
	public $BABYNAME;
	public $BABYNICKNAME;
	public $BABYSEX;
	public $ORDERSTATUS;
	public $ONLINESTATUS;
	public $OFFLINESTATUS;
	public $CHARGE;
	public $ORDERMANAGER;
	public $THIRDORDERID;
	public $DELETESTATUS;
	
	public function getPrint()
	{
		if($this->ISPRINT == 1)
			$this->ISPRINT = "是";
		else
			$this->ISPRINT = "否";
		
		return $this->ISPRINT;
	}
	public function getMemorySuit()
	{
		if($this->MEMORYSUIT == 1)
			$this->MEMORYSUIT = "是";
		else
			$this->MEMORYSUIT = "否";
		
		return $this->MEMORYSUIT;
	}
	public function getOnlineStatus()
	{
		if($this->ONLINESTATUS == 1)
			$this->ONLINESTATUS = "已支付";
		else
			$this->ONLINESTATUS = "未支付";
		
		return $this->ONLINESTATUS;
	}
	public function getOfflineStatus()
	{
		if($this->OFFLINESTATUS == 1)
			$this->OFFLINESTATUS = "已支付";
		else
			$this->OFFLINESTATUS = "未支付";
		
		return $this->OFFLINESTATUS;
	}
	public function getOrderStatus()
	{
		if($this->ORDERSTATUS == 1)
			$this->ORDERSTATUS = "待处理";
		else if($this->ORDERSTATUS == 2)
			$this->ORDERSTATUS = "制作中";
		else if($this->ORDERSTATUS == 3)
			$this->ORDERSTATUS = "已完成";
			
		return $this->ORDERSTATUS;
	}
	public function getProductType()
	{
		if($this->PRODUCTTYPE == 'jizhi')
			$this->PRODUCTTYPE = "极致版";
		else if($this->PRODUCTTYPE == 'zunxiang')
			$this->PRODUCTTYPE = "尊享版";
		else if($this->PRODUCTTYPE == 'diancang')
			$this->PRODUCTTYPE = "典藏版";
			
		return $this->PRODUCTTYPE;
	}
}
