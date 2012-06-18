package com.promise.cn.utils
{
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.UITextFormat;

	/**   
	 * @类名: PBUtil 
	 * @包名: com.promise.cn.utils
	 * @描述: 同心圆 
	 * @作者： xingjian xingjian@yeah.net   
	 * @日期： 2012-6-14 15:44:08 
	 * @版本： V1.0   
	 */
	public class PBUtil
	{
		public function PBUtil()
		{
		}
		
		//计算文本长度
		public static function measureTextWidth(text:String ,fontSize:int,font:String):Number {		
			var uiTextFormat:UITextFormat = new  UITextFormat(FlexGlobals.topLevelApplication.systemManager);
			uiTextFormat.antiAliasType="advanced"; //这两个参数不设置会抛错
			uiTextFormat.gridFitType="pixel";
			// 不设置字体会计算的不对
			uiTextFormat.font=font;//默认字体	
			uiTextFormat.size= fontSize;  //可以设置字体大小
			return uiTextFormat.measureText(text).width;
		}
		

	}
}