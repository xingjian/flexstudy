package com.promise.cn.vo
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.events.MoveEvent;

	public class LinkMap extends Canvas{
		
		[Embed(source="/com/promise/cn/images/client.png")]
		[Bindable]
		public var c2s:Class;
		
		[Embed(source="/com/promise/cn/images/server.png")]
		[Bindable]
		public var s2c:Class;
		//网元名称
		private var ueName:String = "网元";
		private var lineList:Array =new Array();
		private var lineCount:int = 0;
		private var oldIndex:int = 0;
		private var ueImage:Image=new Image();
		private var ueLabel:Label=new Label();
		
		public function LinkMap(point:Point,width:int,height:int,ueName:String,type:int){
			super();
			this.x=point.x;
			this.y=point.y;
			this.width=width;
			this.height=height;
			this.ueName=ueName;
			this.init(type);
		}
		//初始化
		private function init(type:int):void{
			this.addEventListener(flash.events.MouseEvent.MOUSE_DOWN,dragBegin);
			this.addEventListener(flash.events.MouseEvent.MOUSE_UP,dragEnd);
			this.addEventListener(flash.events.MouseEvent.MOUSE_MOVE,dragIng2);
			this.addEventListener(mx.events.MoveEvent.MOVE,dragIng1);
			this.verticalScrollPolicy = "off";
			this.horizontalScrollPolicy = "off";
			this.initLabel();
			this.addChild(ueLabel);
			this.initUeImage(type);
			this.addChild(ueImage);
		}
		private function initUeImage(flag:int):void{
			switch(flag){
				case 1:
					ueImage.source = c2s;break;
				case 2:
					ueImage.source = s2c;break;
			}
			ueImage.x = 10;
			ueImage.y = 0;
		}
		
		private function initLabel():void{
			ueLabel.text = ueName;
			ueLabel.x = 0;
			ueLabel.y = 60;
			ueLabel.width = 99;
			ueLabel.height = 20;
		}
	
		private function dragIng1(event:MoveEvent):void{
			this.refreshLine();
		}
		private function dragIng2(event:MouseEvent):void{
			this.refreshLine();
		}
		private function refreshLine():void{
			var x:int = this.getCenterX();
			var y:int = this. getCenterY();
			for(var i:int=0;i<lineList.length;i++){				
				var lineFlag:LineFlag = lineList[i];
				var line:LinkLine = lineFlag.getLine();
				var isHeaderLine:Boolean = lineFlag.getFlag();
				if(isHeaderLine){
					line.setStartPoint(new Point(x,y));
				}else{
					line.setEndPoint(new Point(x,y));
				}	
				line.drawLine();
			}	
		}
		
		public function setLine(line:LinkLine,flag:Boolean):void{
			var lineFlag:LineFlag = new LineFlag(line,flag);
			lineList[lineCount] = lineFlag;
			lineCount++;
		}
		
		
		private function dragBegin(event:MouseEvent):void{
			oldIndex = this.parent.getChildIndex(this);
			this.parent.setChildIndex(this,this.parent.numChildren-1);
			this.startDrag(false);		
		}
		private function dragEnd(event:MouseEvent):void{
			this.parent.setChildIndex(this,oldIndex);
			this.stopDrag();		    
		}
		public function getCenterX():int{
			return this.x+30;
		}
		public function getCenterY():int{
			return this.y+30;
		}
	}
}