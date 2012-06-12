package com.promise.cn.views
{
	import com.promise.cn.skin.PBTextInputSkin;
	
	import spark.components.TextInput;
	
	[Style(name="icon", inherit="no", type="Object")] 
	[Style(name="radius", inherit="true", type="Number")] 

	public class PBTextInput extends TextInput
	{
		[Embed(source="/com/promise/cn/images/search_input.png")] 
		private const defaultIcon:Class; 

		
		public function PBTextInput()
		{
			super();
			this.setStyle('icon', defaultIcon); 
			this.setStyle('radius', 10); 
			this.setStyle("skinClass", PBTextInputSkin); 

		}
	}
}