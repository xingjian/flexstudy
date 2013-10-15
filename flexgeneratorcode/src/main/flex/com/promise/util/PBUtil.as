package com.promise.util
{
	public class PBUtil
	{
		public function PBUtil()
		{
		}
		
		public static function create(packName:String,className:String,extendsName:String,importName:String,interfacd:String,varName:String,check1:Boolean,check2:Boolean,check3:Boolean):String{
			//处理package
			var retStr:String = "package "+packName+"\n{\n\t";
			//处理导入类
			if(check2==true && importName!=""){
				var inClassArr:Array = importName.split(";");
				for(var i:int = 0;i<inClassArr.length;i++){
					if(i==(inClassArr.length-1)){
						retStr +="import "+inClassArr[i]+";\n\n\t";
					}else{
						retStr +="import "+inClassArr[i]+";\n\t";
					}
				}
			}
			//[RemoteClass(alias="com.promise.cn.common.domain.Menu")]
			//[Bindable]
			retStr += "[RemoteClass(alias="+"\""+packName+"."+className+"\")]\n\t";
			retStr +="[Bindable]\n\t"
			//主体类
			retStr +="public class "+ className +" ";
			//判断是否有继承
			if(check1==true && extendsName!=""){//有继承
				if(check3==false){
					retStr+= "extends "+extendsName+"\n\t{\n\t\t";
				}else{
					retStr+= "extends "+extendsName+" ";
				}
			}else if(check1==false&&check3==false){//没有继承
				retStr+= "\n\t{\n\t\t";
			}
			//判读是否有接口
			if(check3==true && interfacd!=""){
				retStr +="implements ";
				var interArr:Array = interfacd.split(";");
				for(var j:int = 0;j<interArr.length;j++){
					if(j==(interArr.length-1)){
						retStr +=interArr[j];
					}else{
						retStr +=interArr[j]+",";
					}
				}
				retStr +="\n\t{\n\t\t";
			}
			//判断变量名
			if(varName!=""){
				var varArr:Array = varName.split(";");
				for(var n:int=0;n<varArr.length;n++){
					if(n==(varArr.length-1)){
						retStr += "private var _"+varArr[n]+";\n\n\t\t"
					}else{
						retStr += "private var _"+varArr[n]+";\n\t\t"
					}
					
				}
			}
			//构造函数
			retStr += "public function "+className +"(object:Object=null):void"+"\n\t\t{\n\t\t\t";
			retStr +="if(object!=null){\n\t\t\t\t";
			if(varName!=""){
				var varArrTemp:Array = varName.split(";");
				for(var k:int=0;k<varArrTemp.length;k++){
					var arrTemps:Array = varArrTemp[k].toString().split(":");
					if(k==(varArrTemp.length-1)){
						retStr += "this."+arrTemps[0]+" = object."+arrTemps[0]+";\n\t\t\t"
					}else{
						retStr += "this."+arrTemps[0]+" = object."+arrTemps[0]+";\n\t\t\t\t"
					}
				}
			}
			retStr +="}\n";
			retStr +="\t\t}\n\n\t\t";
			//get函数生成
			if(varName!=""){
				var varArrGet:Array = varName.split(";");
				for(var m:int=0;m<varArrGet.length;m++){
					var arrTemp:Array = varArrGet[m].toString().split(":");
					retStr += "public function get "+arrTemp[0]+"():"+arrTemp[1]+"\n\t\t{\n\t\t\t"+"return _"+arrTemp[0]+";\n\t\t}\n\n\t\t";
					retStr+= "public function set "+arrTemp[0]+"(__"+varArrGet[m]+"):void"+"\n\t\t{\n\t\t\t_"+arrTemp[0]+" = __"+arrTemp[0]+";\n\t\t}\n\t\t";
				}
			}
			retStr += "\n\t}\n}";
			return retStr;
		}
	}
}