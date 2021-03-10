// layer managment

layer_set_visible("col",false);
if(room == r_lab){
	if(global.start == 0){
		new_textbox("Use WASD to Move \n space to dismiss text",0);
		new_textbox("E to interact, throw, talk to npcs and pickup \n LShift to roll",0);
		new_textbox("Left mouse to slash and \nright mouse to spin attack",0);
		global.start =1;
	}
	if(global.start ==2){
		new_textbox("You Escaped \n You are free to explore");	
	}
}