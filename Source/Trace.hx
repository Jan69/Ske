class Trace
{
	public static function main(){haxe.Log.trace = trace;trace("Overwrites trace()");};
	public static function overwrite() haxe.Log.trace = trace;
	public static function trace( v : Dynamic, ?inf : haxe.PosInfos )
		{
			haxe.Log.trace = trace;
			#if (!html5&&!emscripten&&!air)
				Sys.println(v);
			#else
				trace(v);
			#end
		}
}
