
function activate_lift_item(){
	if(global.iLift == noone){
		player_action_animation(spr_player_lift);
		global.iLift = argument0;
		with(global.iLift){
			lifted = true;
			///persistent = true;
		}
	}
}

function get_health(){
	if(global.iLift == noone){
		player_action_animation(spr_player_lift);
		
		if(global.player_health <= 2){
			global.player_health ++;
		}
		else if (global.player_health >2) && (global.player_health<3){
			global.player_health = 3;	
		}
		
		global.used_health_caps[? argument0.health_cap_iden] = true;
		instance_destroy(argument0);
		
			
	}
			
}