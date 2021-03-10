
function player_action_animation(){
	//carry out animation/script at end
	state = player_state_action;
	sprite_index = argument[0];
	if(argument_count >1) animationEndScript = argument[1];
	localFrame =0;
	image_index =0;
	player_Animate_Sprite();
}