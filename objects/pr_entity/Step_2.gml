//entity loop

if ( !global.gamePaused){
	depth = -bbox_bottom;
	if(lifted) && (instance_exists(obj_player)){
		if(obj_player.sprite_index != spr_player_lift){
			x = obj_player.x;
			y = obj_player.y -18;
			z=13;
			depth = obj_player.depth -1;
			
		}
	}
	if(!lifted){
		if(thrown){
			throw_distance_travelled = min(throw_distance_travelled +3, throw_distance);
			x=xstart +lengthdir_x(throw_distance_travelled, direction);
			y = ystart + lengthdir_y(throw_distance_travelled, direction);
			if(tilemap_get_at_pixel(collsionMap, x, y) >0){
				thrown = false;
				grav = 0.1;
			}
			throw_percent = throw_start_percent + lerp(0,1-throw_start_percent, throw_distance_travelled/throw_distance);
			z = throw_peak_height* sin(throw_percent * pi);
			if(throw_distance == throw_distance_travelled){
				thrown = false;
				if(entity_throw_break) instance_destroy();
			}
		}
		else{
			if (z>0){
				z = max(z-grav, 0);
				grav += 0.1;
				if(z==0) && (entity_throw_break) instance_destroy();
			}
			else{
				grav = 0.1;
			}
		}
	}
}
flash=max(flash-0.04,0);