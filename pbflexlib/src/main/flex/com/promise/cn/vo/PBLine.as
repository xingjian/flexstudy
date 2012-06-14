package com.promise.cn.vo
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import mx.core.UIComponent;
	/**   
	 * @类名: PBLine 
	 * @包名: com.promise.cn.vo
	 * @描述: 绘制线 
	 * @作者： xingjian xingjian@yeah.net   
	 * @日期： 2012-6-14 15:44:08 
	 * @版本： V1.0   
	 */
	public class PBLine extends UIComponent
	{
		//线起点
		private var _startPoint:Point;
		//线终点
		private var _endPoint:Point;
		//线条颜色
		private var _lineColor:uint=0xA3CEEA;
		//线提示语
		private var _tip:String="";
		//是否要箭头
		private var _isArrow:Boolean=false;
		//箭头大小
		private var _radius:uint=6;
		//箭头线宽度
		private var _arrowTickness:Number = 2;
		//线宽度
		private var _lineTickness:Number = 4;
		
		public function PBLine(startPoint:Point=null,endPoint:Point=null,lineColor:uint=0xA3CEEA,tip:String="",isArrow:Boolean=true,radius:uint=6,arrowTickness:Number = 2,lineTickness:Number = 4){
			super();
			this.startPoint = startPoint;
			this.endPoint = endPoint;
			this.lineColor = lineColor;
			this.tip = tip;
			this.isArrow = isArrow;
			this.radius = radius;
			this.arrowTickness = arrowTickness;
			this.lineTickness = lineTickness;
		}
		
		//获得线的角度
		public function getAngle():Number{
			var tmpx:Number=endPoint.x - startPoint.x;
			var tmpy:Number=startPoint.y - endPoint.y;
			var angle:Number= Math.atan2(tmpy,tmpx)*(180/Math.PI);
			return angle;
		}
		
		//画线
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			this.graphics.clear();
			this.graphics.lineStyle(lineTickness,lineColor);
			this.graphics.moveTo(startPoint.x,startPoint.y);
			this.graphics.lineTo(endPoint.x,endPoint.y);
			if(null!=tip||tip!=""){
				this.toolTip = tip;
			}
			if(isArrow){
				var angle:Number = this.getAngle();
				var centerX:Number = endPoint.x - radius * Math.cos(angle*(Math.PI/180));
				var centerY:Number = endPoint.y + radius * Math.sin(angle*(Math.PI/180));
				var topX:Number = endPoint.x;
				var topY:Number = endPoint.y;
				var leftX:Number = centerX + radius * Math.cos((angle+120)*(Math.PI/180));
				var leftY:Number = centerY - radius * Math.sin((angle+120)*(Math.PI/180));
				var rightX:Number = centerX + radius * Math.cos((angle+240)*(Math.PI/180));
				var rightY:Number = centerY - radius * Math.sin((angle+240)*(Math.PI/180));
				this.graphics.beginFill(lineColor,1);
				this.graphics.lineStyle(arrowTickness,lineColor,1);
				this.graphics.moveTo(topX,topY);
				this.graphics.lineTo(leftX,leftY);
				this.graphics.lineTo(centerX,centerY);
				this.graphics.lineTo(rightX,rightY);
				this.graphics.lineTo(topX,topY);
				this.graphics.endFill();
			}
		}

		public function get startPoint():Point
		{
			return _startPoint;
		}

		public function set startPoint(value:Point):void
		{
			_startPoint = value;
		}

		public function get endPoint():Point
		{
			return _endPoint;
		}

		public function set endPoint(value:Point):void
		{
			_endPoint = value;
		}

		public function get lineColor():uint
		{
			return _lineColor;
		}

		public function set lineColor(value:uint):void
		{
			_lineColor = value;
		}

		public function get tip():String
		{
			return _tip;
		}

		public function set tip(value:String):void
		{
			_tip = value;
		}

		public function get isArrow():Boolean
		{
			return _isArrow;
		}

		public function set isArrow(value:Boolean):void
		{
			_isArrow = value;
		}

		public function get radius():uint
		{
			return _radius;
		}

		public function set radius(value:uint):void
		{
			_radius = value;
		}

		public function get arrowTickness():Number
		{
			return _arrowTickness;
		}

		public function set arrowTickness(value:Number):void
		{
			_arrowTickness = value;
		}

		public function get lineTickness():Number
		{
			return _lineTickness;
		}

		public function set lineTickness(value:Number):void
		{
			_lineTickness = value;
		}
		
	}
}