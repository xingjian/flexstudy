package com.promise.cn.vo
{
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import mx.core.UIComponent;
	
	/** 
	 * 
	 * 信息滚动显示(跑马灯控件) 
	 * @version 
	 * <pre> 
	 * 修改版本: 1.0.0 
	 * 修改日期：2009-1-15 
	 * 修改人 : zhang 
	 * 修改说明：形成初始版本 
	 *</pre> 
	 * 
	 * * 功能： 
	 * 1.直接将某TextField转换为跑马灯文本 changeTextFieldToMarqueeText 
	 * 2.动态设定显示宽度 width 
	 * 3.动态设定一次移动间隔时间 delay 
	 * 4.动态设定一次移动间隔距离 step 
	 * 5.设定默认文本显示样式 defaultTextFormat 
	 * 6.动态设定文本显示样式 setTextFormat 
	 * */ 
	public class BroadCastMarquee extends UIComponent 
	{ 
		
		[Bindable] 
		private var broadcastText:String="broadcast message"; 
		
		private var m_timer:Timer; 
		
		private var m_DefaultText_X:Number=0; 
		
		//每次移动距离 
		private var m_step:Number=10; 
		
		//滚动范围 
		private var m_rect:Rectangle; 
		
		//移动时间间隔 
		private var t_delay:Number=100; 
		
		//广播信息滚动宽度 
		private var m_Width:Number; 
		
		//滚动方向属性 
		[Inspectable(defaultValue="left",enumeration="right,left", category="direction", type="String")] 
		public var ScrollDirection:String="left"; 
		
		
		//显示内容样式 
		[Bindable] 
		private var m_TextFormat:TextFormat=new TextFormat("微软雅黑",12,0xff0000,"bold"); 
		
		/**广播信息内容显示控件*/ 
		private var m_BroadCastText:TextField; 
		
		// private var m_BroadcastLabel:Label; 
		
		public function BroadCastMarquee() 
		{ 
			super(); 
			
			InitBroadcast(); 
			
			addEventListener(MouseEvent.MOUSE_OVER,rollOverHandler); 
			addEventListener(MouseEvent.ROLL_OUT, rollOutHandler); 
			
		} 
		
		/**初始化*/ 
		private function InitBroadcast():void 
		{ 
			/**广播信息显示控件初始化*/ 
			m_BroadCastText=new TextField(); 
			m_BroadCastText.autoSize=TextFieldAutoSize.LEFT; 
			m_BroadCastText.multiline=false; 
			m_BroadCastText.selectable=false; 
			m_BroadCastText.x=m_BroadCastText.y=m_DefaultText_X 
			m_BroadCastText.wordWrap=false; 
			m_BroadCastText.setTextFormat(m_TextFormat);
			m_BroadCastText.text=broadcastText; 
			m_BroadCastText.defaultTextFormat=m_TextFormat; 
			addChild(m_BroadCastText); 
			
			
			this.m_Width=this.width; 
			m_rect=new Rectangle(0,0,this.width,this.m_BroadCastText.textHeight); 
			this.m_BroadCastText.scrollRect=m_rect; 
			
			m_timer = new Timer(t_delay); 
			
			ScrollBroadText(); 
			
			
		}   
		
		/** 
		 * 如果有新的广播消息,或者长度改变进行滚动显示 
		 * */ 
		private function ScrollBroadText():void 
		{ 
			if(this.m_timer!=null) 
			{ 
				//停止移动 
				StopMoveBroadcast(); 
				
				if(this.broadcastText!="") 
				{ 
					m_timer.addEventListener(TimerEvent.TIMER, timerhandler); 
					m_timer.start(); 
				} 
				// Math.abs( 
				
			} 
		} 
		
		/**控制滚动信息*/ 
		private function timerhandler(evt:TimerEvent):void 
		{ 
			if(this.m_BroadCastText.textWidth>0) 
			{ 
				
				if(ScrollDirection.toLowerCase()=="left") 
				{ 
					
					if(m_rect.x<=this.m_BroadCastText.textWidth) 
					{ 
						// this.m_BroadCastText.x+=(-this.m_step); 
						m_rect.x+=this.m_step; 
						
					}else 
					{ 
						//this.m_BroadCastText.x=m_DefaultText_X+this.m_BroadCastText.textWidth; 
						m_rect.x=-(m_DefaultText_X+this.m_Width); 
					} 
					
					
				}else 
				{ 
					
					if(Math.abs(m_rect.x)<=this.m_BroadCastText.textWidth) 
					{ 
						m_rect.x-=this.m_step; 
						
					}else 
					{ 
						this.m_rect.x=m_DefaultText_X; 
						
					} 
					
				} 
				
				m_BroadCastText.scrollRect = m_rect;    
				
			}else 
			{ 
				//停止移动 
				StopMoveBroadcast(); 
			} 
			
			
			
		} 
		
		/**停止移动*/ 
		private function StopMoveBroadcast():void 
		{ 
			if(m_timer!=null) 
			{ 
				this.m_timer.stop(); 
				if(m_timer.hasEventListener(TimerEvent.TIMER)) 
					m_timer.removeEventListener(TimerEvent.TIMER, timerhandler); 
				
				m_BroadCastText.x=this.m_DefaultText_X; 
				m_rect.height = m_BroadCastText.height; 
				// this.height=m_rect.height; 
				m_BroadCastText.scrollRect = m_rect; 
			} 
		} 
		
		
		/**************************广播信息处理事件*********************************/ 
		
		/**鼠标经过处理事件*/ 
		protected function rollOverHandler(event:MouseEvent):void 
		{ 
			if(this.m_timer!=null&&this.broadcastText!="") 
			{ 
				this.m_timer.stop(); 
			} 
		} 
		
		/**鼠标离开处理事件*/ 
		protected function rollOutHandler(event:MouseEvent):void 
		{ 
			if(this.m_timer!=null&&this.broadcastText!="") 
			{ 
				this.m_timer.start(); 
			} 
		} 
		
		
		/**************************广播信息属性*************************************/ 
		
		/**移动时间间隔*/ 
		public function set BroadCastDeplay(value:Number):void 
		{ 
			this.m_timer.delay=value;           
		} 
		
		/**设置广播信息内容*/ 
		public function set BroadCastText(value:String):void 
		{ 
			this.m_BroadCastText.text=value; 
			ScrollBroadText(); 
		} 
		
		/**取得广播信息内容*/ 
		public function get BroadCastText():String 
		{ 
			return this.broadcastText; 
		} 
		
		
		/**广播信息宽度宽度*/ 
		public override function get width():Number 
		{ 
			return this.m_Width; 
		} 
		
		public override function set width(width:Number):void 
		{ 
			this.m_Width=width; 
			this.m_rect.width=this.m_Width; 
			this.m_BroadCastText.scrollRect=this.m_rect; 
			ScrollBroadText(); 
			// this.m_BroadCastText.setTextFormat 
		} 
		
		
		/**设置滚动方向('left' or 'right')*/ 
		public function set Direction(value:String):void 
		{ 
			this.ScrollDirection=value; 
			ScrollBroadText(); 
		} 
		
		
		/**设置字体格式化样式*/ 
		public function set defaultTextFormat(format:TextFormat):void 
		{ 
			this.m_BroadCastText.defaultTextFormat=format; 
			this.setTextFormat(format); 
			// 
		} 
		
		public function setTextFormat(format:TextFormat, beginIndex:int = -1, endIndex:int = -1):void 
		{ 
			m_BroadCastText.setTextFormat(format, beginIndex, endIndex); 
			ScrollBroadText(); 
		} 
		
		
		/**字体大小*/ 
		public function set fontSize(value:Object):void 
		{ 
			this.m_TextFormat=new TextFormat(this.m_TextFormat.font,value,this.m_TextFormat.color); 
			this.m_BroadCastText.setTextFormat(this.m_TextFormat,-1,-1); 
			
		} 
		
		/**字体名称*/ 
		public function set fontFamily(value:String):void 
		{ 
			this.m_TextFormat=new TextFormat(value,this.m_TextFormat.size,this.m_TextFormat.color); 
			this.m_BroadCastText.setTextFormat(this.m_TextFormat,-1,-1); 
		} 
		
		/**字体颜色*/ 
		public function set color(value:Object):void 
		{ 
			this.m_TextFormat=new TextFormat(this.m_TextFormat.font,this.m_TextFormat.size,value); 
			this.m_BroadCastText.setTextFormat(this.m_TextFormat,-1,-1); 
		} 
		
		/**是否是粗体*/ 
		public function set fontWeight(value:Object):void 
		{ 
			this.m_TextFormat=new TextFormat(this.m_TextFormat.font,this.m_TextFormat.size,this.m_TextFormat.color,value) 
			this.m_BroadCastText.setTextFormat(this.m_TextFormat,-1,-1); 
		} 
	}   
}

