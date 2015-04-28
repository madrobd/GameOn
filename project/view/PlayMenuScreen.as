﻿package  {
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	
	public class PlayMenuScreen extends Sprite{
		
		public static var newGame:Boolean;
		
		var continueButton:Image;
		var newGameButton:Image;
		
		
		public function PlayMenuScreen() {
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event)
		{
			trace("PlayMenuScreen loaded");
			
			addNewGameButton();
			
//if there is a saved game state on the device, then execute
			addContinueButton();
			
			newGame = false;
		}
		
		
		//--------------------start of adding buttons----------------

		private function addContinueButton(){
			var texture:Texture = Texture.fromBitmapData( new ContinueButton() );
			continueButton = new Image( texture );
			addChild( continueButton );
			
			continueButton.y = 0;
			
			continueButton.addEventListener( TouchEvent.TOUCH , onContinueButton );
		}
		
		private function addNewGameButton(){
			var texture:Texture = Texture.fromBitmapData( new NewGameButton() );
			newGameButton = new Image( texture );
			addChild( newGameButton );
			
			newGameButton.y = 100;
			
			newGameButton.addEventListener( TouchEvent.TOUCH , onNewGameButton );
		}
		//---------------end of adding buttons------------------
		
		
		
		//---------------start of button's event handlers-------
		
		private function onContinueButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
				Navigator.instance.loadScreen( "levelSelect" );
			}
		}
		
		private function onNewGameButton(event:TouchEvent){
			var touch:Touch = event.touches[0];
			if(touch.phase == TouchPhase.BEGAN)
			{ 
// WARNING that New Game deletes all progress! 
				newGame = true;
				Navigator.instance.loadScreen( "genderSelect" );
			}
		}
		//---------------end of button's event handlers---------

	}
	
}