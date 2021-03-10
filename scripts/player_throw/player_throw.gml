
function player_throw(){
	with(global.iLift){
		lifted = false;
		persistent= false;
		thrown = true;
		z= 13;
		throw_peak_height = z+10;
		throw_distance = entity_throw_distance;
		throw_distance_travelled =0;
		throw_start_percent = (13/throw_peak_height) *0.5;
		throw_percent = throw_start_percent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	player_action_animation(spr_player_lift);
	global.iLift =noone;

}