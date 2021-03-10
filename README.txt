Ian Borwick - iborwick@uwo.ca - 250950449

How to Run:
	Download the AlmostHuman.exe file and follow the installation wizard instructions
	Run the AlmostHuman.app

Controls:
	Movement: Use WASD to move around (or the arrow keys)
	Intract: Use the "E" key to roll, pickup, throw, interact, and talk to NPCS
	Dissmiss Text: Use Space bar to dismiss on screen text
	Attack: Use left mouse to perform a slash and right mouse to spin attack
	Reset: Press R to reset the game
	Pause: Press esc key to pause the game

You must explore the floor in an efort to escape,
you must fight the mini boss to get the key to the elevator where you must defeat the floor boss to gain your freedom

Features:

	Enemeys:
		Types:
			Blood Slime (4 hours)
			Blood Slime medium (2 hours)
			Blood Slime mini boss (4 hours)
			Patient (2 hours)
			Bloody Patient (1 hour)
			Patient Boss (2 hours)
		States: (Code from a tutorial used in this but only for the blood slime enemy)
			Hurt (1 hour)
			Wander (2 hours)
			Attack (1 hour)
			Chase (1 hour)
			Die (1 hour)
			Wait (>1 hour)
		Animations:
			Indavidual animations for each enemy type in each state (6 hours)

	Items:
		Types: 
			Entities (6-8 hours)
			Fragments (2 hours)
		Sprites:
			Indavidual sprites for each type of item with fragments for those that can break (4 hours)
		Uses:
			Heal (2 hours)
			Unlock doors (3 hours)
			Pick Up (1 hour)
			Throw (1 hour)

	Levels: 
		r_hall_floor1 (3 hours)
		r_lab (2 hours)
		r_room1_floor1 (1 hour)
		r_room2_floor1 (1 hour)
		r_room3_floor1 (1 hour)
		r_room4_floor1 (1 hour)
		r_roomBoss_floor1 (2 hours)
		r_roomExit (2 hours)
		r_roomICU_floor1 (1 hour)
		r_roomXray_floor1 (2 hours)
		r_init (1 hour)
		r_parent (1 hour)
			

	Player:
		States: 
			Bonk/wall rebound (2 hours)
			Attack (2 hours)
				Slash and Spin with corrosponding hitboxes
			Action (1 hour)
			Free (3 hours)
			Locked (>10 min)
			Roll (1 hour)
			Transition (30 min)
			Dead (30 min)
		Animations:
			I purchases an asset sprite pack detailed below, within this it gave me a charecter and the walking animation.
			Every other player animation was hand made by me.
	Game:
		ScreenShake (2 hours)
		Textboxes (2 hours)
		Wall rebound (2 hours)
		Room Transition (30 min)
			Code from a tutorial used in this
		Health Bar:
			Pixel art design by me (1 hour)
		Shaders:
			White flash shader (30 min)
			Red flash shader (>30 min)
		Pause:
		Reset

I followed a rpg tutorial to help me start the code. In doing so it helped me set up the basic mechanics for most of the game.
I used it to build the state machine for players, the camera controls, shaders, state machine for the slime enemy, and the tile collision system.
However everything else I built myself. I stopped using the tutorial after the slime monster creation, and expanded on the majority of code 
I got help with in the tutorial.


In addition I purchased a sprite pack to give me some assets. I designed all but the basic walking animations for all objects.

The links for the tile set and tutorial are:

https://malibudarby.itch.io/horror-city-hospital-tiles
https://www.youtube.com/watch?v=upoXH9hAKUg&list=PLPRT_JORnIuosvhfax2TQTEmN7OYTcSvK&ab_channel=ShaunSpalding