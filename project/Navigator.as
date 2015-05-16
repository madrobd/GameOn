﻿package {

	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.utils.AssetManager;
	import flash.desktop.NativeApplication;
	import flash.filesystem.File;
	import flash.system.Capabilities;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import view.*;
	
	
	public class Navigator extends Sprite {

		//Makes the variable usable by other classes.
		public static var instance: Navigator;

		//Variable needed to load instances of other classes.
		var nextScreen: Sprite;
		
		// This is the path the user follows through all the menu screens.
		public static var breadcrumbs:Vector.<String> = new Vector.<String>();
		

		//constructor code
		public function Navigator() {

		}

		public function start(assets:AssetManager){
			trace ("werkt");
			loadScreen("mainMenu");
		}

		//Switch screen function. Code to load a new screen and remove the previous screen from the stage. Loads mainMenu by default.
		public function loadScreen(screenName: String) // screenName:String = "mainMenu"
		{
			if (nextScreen != null && contains(nextScreen)) {
				removeChild(nextScreen, true);
			}

			if (screenName == "mainMenu") {
				nextScreen = new MainMenuScreen();
			}

			else if ( screenName == "playMenu" ){
				nextScreen = new PlayMenuScreen();
			}
			
			else if ( screenName == "genderSelect" ){
				nextScreen = new GenderSelectScreen();
			}
			
			else if ( screenName == "tutorial" ){
				nextScreen = new TutorialScreen();
			}
			
			else if ( screenName == "pharmacy" ){
				nextScreen = new PharmacyScreen();
			}
			
			else if ( screenName == "optionsMenu" ){
				nextScreen = new OptionsMenuScreen();
			}
			
			else if ( screenName == "levelSelect" ){
				nextScreen = new LevelSelectScreen();
			}
			
			else if ( screenName == "story" ){
				nextScreen = new StoryScreen();
			}
			
			else if ( screenName == "lostGame" ){
				nextScreen = new LostGameScreen();
			}
			
			else if ( screenName == "scoreScreen" ){
				nextScreen = new ScoreScreen();
			}
			
			else if ( screenName == "game" ){
				nextScreen = new GameScreen();
			}
			
			// Makes sure there are no duplicate values in the breadcrumbs Vector
			if (breadcrumbs.indexOf(screenName) == -1){
				breadcrumbs.push(screenName);
			}
			
			trace(breadcrumbs);
			
			
			addChild(nextScreen);
		}
		
		protected function onKeyDown(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.BACK)
			{
				//handle the button press here.
				trace("Devices BACK button pressed");
				
				breadcrumbs.pop();
				
				breadcrumbs[0]="mainMenu";
				
				loadScreen(breadcrumbs[breadcrumbs.length -1]);
			}
			else if(e.keyCode == Keyboard.HOME)
			{
				//handle the button press here.
				trace("Devices HOME button pressed");
				trace("This doesn't work on PC");
			}
			else if(e.keyCode == Keyboard.MENU)
			{
				//handle the button press here.
				trace("Devices MENU button pressed");
			}
		}
		
	}

}