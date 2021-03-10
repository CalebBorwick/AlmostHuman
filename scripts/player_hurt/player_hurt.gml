
function player_hurt(_direction, _force, _damage){
	if(obj_player.invulnerable <=0){
		global.player_health = max(0,global.player_health - _damage);
		
		if (global.player_health >0){
			with(obj_player){
				state = player_state_bonk;
				direction = _direction -180;
				move_distance_remaining = _force;
				screen_shake(2,10);
				flash = 0.7;
				invulnerable = 60;
				
			}
		}
		else{
			//death
			with(obj_player) state = player_state_dead;
		}
	}
}