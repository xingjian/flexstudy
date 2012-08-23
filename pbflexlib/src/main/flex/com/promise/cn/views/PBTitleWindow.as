package com.promise.cn.views
{
	import com.promise.cn.skins.PBTitleWindowSkin;
	
	import spark.components.TitleWindow;
	
	public class PBTitleWindow extends TitleWindow
	{
		[Bindable]
		[Embed(source="/com/promise/cn/images/search_input.png")] 
		private var image:Class; 
		
		public function PBTitleWindow()
		{
			super();
			this.setStyle("skinClass", PBTitleWindowSkin); 
		}
		
		public function set titleIcon(titleIcon:Class):void{
			this.image = titleIcon;
			this.setStyle('icon', image); 
		}
	}
}