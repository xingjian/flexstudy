package com.promise.cn.vo
{
	public class PBPoint
	{
		public var x:Number;
		public var y:Number;
		public var label:String;
		public var toolTip:String;
		public var id:String;
		
		public function PBPoint(object:Object = null)
		{
			if(null!=object){
				this.id = object.id;
				this.x = object.x;
				this.y = object.y;
				this.label = object.y;
				this.toolTip = object.toolTip;
			}
		}
	}
}