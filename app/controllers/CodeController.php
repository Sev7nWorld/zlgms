<?php

use Phalcon\Tag;
use Phalcon\Mvc\View as View;

Class CodeController extends ControllerBase {

	public function randStr($len=6,$format='ALL') {
           switch($format) {
                 case 'ALL':
                 $chars='ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789'; break;
                 case 'CHAR':
                 $chars='ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz'; break;
                 case 'NUMBER':
                 $chars='123456789'; break;
                 default :
                 $chars='ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789';
                 break;
			   }
		 $string="";
		 while(strlen($string)<$len)
			$string.=substr($chars,(mt_rand()%strlen($chars)),1);
		 return $string;
	}
	public function indexAction()
	{
		$this->session->set('re_code','');
		$type = 'gif';
		$width= 38;
		$height= 15;
		$this->response->setHeader("Content-type", "image/".$type);
		$this->response->setHeader("charset", "utf-8");

		srand((double)microtime()*1000000);
		$randval = $this->randStr(4,"ALL");
		
		if($type!='gif' && function_exists('imagecreatetruecolor')){
			 $im = @imagecreatetruecolor($width,$height);
		}else{
			 $im = imagecreate($width,$height);
		}

			 $r = Array(225,211,255,223);
			 $g = Array(225,236,237,215);
			 $b = Array(225,236,166,125);

			 $key = rand(0,3);
		 
			 $backColor = ImageColorAllocate($im,51,153,255);//背景色（随机）
			 $borderColor = ImageColorAllocate($im,102,153,255);//边框色
			 $pointColor = ImageColorAllocate($im, 51, 153, 255);//点颜色

			 imagefilledrectangle($im, 0, 0, $width - 1, $height - 1, $backColor);//背景位置
			 imagerectangle($im, 0, 0, $width-1, $height-1, $borderColor); //边框位置
			 $stringColor = ImageColorAllocate($im, 255,255,255);
		
			 imagestring($im, 3, 5, 1, $randval, $stringColor);
			 imagegif($im);
			 imagedestroy($im);
			 $this->session->set('re_code',$randval);
			 
			 $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
	 }
	 
	 public function checkAction()
	 {
		$code = $this->request->getPost("checkcode");
		$re_code = $this->session->get('re_code');
		if(strtolower($code) == strtolower($re_code))
		{
			echo 1;
		}else{
			echo 2;
			}
		 $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
	 }
	
}
 
?>