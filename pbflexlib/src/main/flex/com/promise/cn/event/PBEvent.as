package com.promise.cn.event
{
	import flash.events.Event;

	public class PBEvent extends Event
	{
		//PbProcessAxis选中节点抛出该事件
		public static var PBPROCESSAXISSELECTNODE:String = "pbProcessAxisSelectNode";
		//事件传递数据对象
		private var _data:Object;
		//回调函数
		private var _callback:Function;
		
		public function PBEvent(type:String,data:Object = null, callback:Function = null){
			super(type, bubbles, cancelable);
			if(data!=null){
				_data = data;
				_callback = callback;
			}
		}
		
		public function get callback():Function{
			return _callback;
		}
		
		public function set callback(value:Function):void
		{
			_callback = value;
		}
		
		public function get data():Object{
			return _data;
		}
		
		public function set data(data:Object):void{
			this._data = data;
		}
	}
}