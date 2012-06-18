package com.promise.cn.vo
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	
	import spark.components.Label;
	/**   
	 * @类名: PBConcentricCircle 
	 * @包名: com.promise.cn.vo
	 * @描述: 同心圆 
	 * @作者： xingjian xingjian@yeah.net   
	 * @日期： 2012-6-14 15:44:08 
	 * @版本： V1.0   
	 */
	public class PBConcentricCircle extends UIComponent
	{
		private var _radius:Number ;
		private var _fillColor:uint;
		private var _borderColor:uint;
		private var _centerX:Number;
		private var _centerY:Number;
		private var _interval:Number;
		private var _overFillColor:uint;
		private var _tip:String;
		private var _pId:String;
		
		//带参数构造函数
		public function PBConcentricCircle(pId:String="",centerX:Number=0,centerY:Number=0,radius:Number=7,interval:Number=4,toolTip:String="",fillColor:uint=0x6391C4,overFillColor:uint=0xff0000)
		{
			super();
			this.pId = pId;
			this.centerX = centerX;
			this.centerY = centerY;
			this.radius = radius;
			this.interval = interval;
			if(null!=toolTip||toolTip!=""){
				this.toolTip = toolTip;
			}
			this.fillColor = fillColor;
			this.overFillColor = overFillColor;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			graphics.clear();
			this.buttonMode = true;
			graphics.lineStyle(2,fillColor,1);
			graphics.beginFill(0xffffff,1);
			graphics.drawCircle(centerX,centerY,radius);
			graphics.endFill();
			graphics.beginFill(fillColor,1);
			graphics.drawCircle(centerX,centerY,radius-interval);
			graphics.endFill();
			this.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandle);
			this.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandle);
		}
		
		public function mouseOverHandle(event:MouseEvent):void{
			graphics.clear();
			graphics.lineStyle(2,fillColor,1);
			graphics.beginFill(0xffffff,1);
			graphics.drawCircle(centerX,centerY,radius);
			graphics.endFill();
			graphics.lineStyle(2,overFillColor,1);
			graphics.beginFill(overFillColor,1);
			graphics.drawCircle(centerX,centerY,radius-interval);
			graphics.endFill();
		}
		
		public function mouseOutHandle(event:MouseEvent):void{
			graphics.lineStyle(2,fillColor,1);
			graphics.beginFill(0xffffff,1);
			graphics.drawCircle(centerX,centerY,radius);
			graphics.endFill();
			graphics.beginFill(fillColor,1);
			graphics.drawCircle(centerX,centerY,radius-interval);
			graphics.endFill();
		}

		public function set radius(value:Number):void
		{
			_radius = value;
		}

		public function get radius():Number
		{
			return _radius;
		}

		public function get fillColor():uint
		{
			return _fillColor;
		}

		public function set fillColor(value:uint):void
		{
			_fillColor = value;
		}

		public function get borderColor():uint
		{
			return _borderColor;
		}

		public function set borderColor(value:uint):void
		{
			_borderColor = value;
		}

		public function get centerX():Number
		{
			return _centerX;
		}

		public function set centerX(value:Number):void
		{
			_centerX = value;
		}

		public function get centerY():Number
		{
			return _centerY;
		}

		public function set centerY(value:Number):void
		{
			_centerY = value;
		}

		public function get interval():Number
		{
			return _interval;
		}

		public function set interval(value:Number):void
		{
			_interval = value;
		}

		public function get overFillColor():uint
		{
			return _overFillColor;
		}

		public function set overFillColor(value:uint):void
		{
			_overFillColor = value;
		}

		public function get tip():String
		{
			return _tip;
		}

		public function set tip(value:String):void
		{
			_tip = value;
			this.toolTip = _tip;
		}

		public function get pId():String
		{
			return _pId;
		}

		public function set pId(value:String):void
		{
			_pId = value;
		}


	}
}