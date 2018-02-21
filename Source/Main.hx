package;

import Trace;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.FPS;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Assets;
//import lime.ui.Window;


class Main extends Sprite {
	

	
	private var Logo:Sprite;
	
	private var movingDown:Bool;
	private var movingLeft:Bool;
	private var movingRight:Bool;
	private var movingUp:Bool;
	
	
	public function new () {
		#if !html5
			Trace.overwrite(); //remaps to sys.println
		#end
		super ();
		
		var fps:FPS = new FPS(10, 10, 0xffffff);addChild (fps);
		Logo = new Sprite ();
		Logo.addChild (new Bitmap (Assets.getBitmapData ("assets/openfl.png")));
		Logo.x = 100;
		Logo.y = 100;
		Logo.buttonMode = true;
		addChild (Logo);
		
		stage.addEventListener (KeyboardEvent.KEY_DOWN, stage_onKeyDown);
		stage.addEventListener (KeyboardEvent.KEY_UP, stage_onKeyUp);
		stage.addEventListener (Event.ENTER_FRAME, this_onEnterFrame);
		
	}
	
	
	
	
	// Event Handlers
	
	
	
	
	private function stage_onKeyDown (event:KeyboardEvent):Void {
		
		switch (event.keyCode) {
			
			case Keyboard.DOWN: movingDown = true;
			case Keyboard.LEFT: movingLeft = true;
			case Keyboard.RIGHT: movingRight = true;
			case Keyboard.UP: movingUp = true;
			
		}
		
	}
	
	
	private function stage_onKeyUp (event:KeyboardEvent):Void {
		
		switch (event.keyCode) {
			
			case Keyboard.DOWN: movingDown = false;
			case Keyboard.LEFT: movingLeft = false;
			case Keyboard.RIGHT: movingRight = false;
			case Keyboard.UP: movingUp = false;
			
		}
		
	}
	
	
	private function this_onEnterFrame (event:Event):Void {
		//var width=500;
		//var length=500;
		if (movingDown)
			{
			if(Logo.y <= stage.stageHeight-Logo.height){
			Logo.y += 5;
			trace(Logo.y);
			};
			else trace("too low");
			
		}
		
		if (movingLeft) {
			if(Logo.x >= 0)
			{
			Logo.x -= 5;
			trace(Logo.x);
			};
			else trace("too left");
		}
		
		if (movingRight) {
			if(Logo.x <= stage.stageWidth-Logo.width)
			{
			Logo.x += 5;
			trace(Logo.x);
			};
			else trace("too right");
			
		}
		
		if (movingUp) {
			if(Logo.y >= 0)
			{
			Logo.y -= 5;
			trace(Logo.y);
			};
			else trace("too high");
		}
		
	}
	
	
}
