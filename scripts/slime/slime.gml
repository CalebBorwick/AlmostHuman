
function blood_slime_chase(){
	sprite_index = spr_move;
	
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToTarg = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if(_distanceToTarg >enemy_speed){
			hSpeed = lengthdir_x(enemy_speed,dir);
			vSpeed = lengthdir_y(enemy_speed, dir);
			
		}
		else{
			hSpeed = lengthdir_x(_distanceToTarg,dir);
			vSpeed = lengthdir_y(_distanceToTarg,dir);
		}
		if(hSpeed !=0) image_xscale = sign(hSpeed);
		
		enemy_tile_collision()
		
		
	}
	//check for attack
	if (instance_exists(target)) && (point_distance(x,y,target.x,target.y) <= enemy_attack_radius){
		state = ENEMYSTATE.ATTACK;
		sprite_index = spr_attack;
		image_index = 0;
		image_speed = 1.0;
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
	
	
	
}
	

function blood_slime_attack(){
	var _spd = enemy_speed;
	
	if(image_index <2) _spd = 0;
	
	if(floor(image_index) ==3) || (floor(image_index = 6))image_speed = 0;
	
	var _distance_to_targ = point_distance(x,y,xTo,yTo);
	
	if(_distance_to_targ < 4) && (image_index <5) image_speed =1.0;
	
	if(_distance_to_targ >_spd){
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if(hSpeed!=0) image_xscale = sign(hSpeed);
		
		if(enemy_tile_collision() == true){
			
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		if(floor(image_index) == 5){
			state_target = ENEMYSTATE.CHASE;
			state_wait_duration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}

	
}
	

function blood_slime_wander(){
	sprite_index =spr_move;
	
	//at destination
	if((x==xTo) && (y==yTo)) || (time_passed >enemy_wander_distance/enemy_speed){
			hSpeed =0;
			vSpeed =0;
			if(image_index <1){
				image_speed = 0.0;
				image_index =0;
			}
			
			if(++wait >= wait_duration){
				wait =0;
				time_passed = 0;
				dir = point_direction(x,y,xstart,ystart) +irandom_range(-45,45);
				xTo = x +lengthdir_x(enemy_wander_distance, dir);
				yTo = y + lengthdir_y(enemy_wander_distance, dir);
		}
	}
	//move towards new destination
	else{
		time_passed++;
		image_speed = 1.0;
		var _distance_to_go =point_distance(x,y,xTo,yTo);
		var _speed_this_frame = enemy_speed;
		if(_distance_to_go <enemy_speed) _speed_this_frame = _distance_to_go;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speed_this_frame,dir);
		vSpeed = lengthdir_y(_speed_this_frame, dir);
		if(hSpeed !=0) image_xscale = sign(hSpeed);
		
		//collisions
		script_execute(enemy_tile_collision);
	
	}
	
	
	//check aggro
	if(++aggro_check >- aggro_check_duration){
		aggro_check =0;
		if(instance_exists(obj_player)) && (point_distance(x,y,obj_player.x, obj_player.y) <=enemy_aggro_radius){
			state = ENEMYSTATE.CHASE;
			target = obj_player;
			
		}
	}
	

}
	

function blood_slime_hurt(){
	sprite_index = spr_hurt;
	var _distance_to_go = point_distance(x,y,xTo,yTo);
	if(_distance_to_go >enemy_speed){
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemy_speed, dir);
		vSpeed = lengthdir_y(enemy_speed,dir);
		if(hSpeed !=0) image_xscale = -sign(hSpeed);
		
		if(enemy_tile_collision()){
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		if(state_previous != ENEMYSTATE.ATTACK) state = state_previous; else state = ENEMYSTATE.CHASE;
	}
}


function blood_slime_die(){
	sprite_index = spr_die;
	image_speed = 1.0;
	var _distance_to_go = point_distance(x,y,xTo,yTo);
	if (_distance_to_go >enemy_speed){
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemy_speed, dir);
		vSpeed = lengthdir_y(enemy_speed,dir);
		if(hSpeed !=0) image_xscale = -sign(hSpeed);
		
		//collide and commit to movement
		enemy_tile_collision();
	}
	else{
		x=xTo;
		y=yTo;
	}
	if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		instance_destroy();
	}
	
}

function blood_slime_big_die(){
	sprite_index = spr_die;
	image_speed = 1.0;
	var _distance_to_go = point_distance(x,y,xTo,yTo);
	if (_distance_to_go >enemy_speed){
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemy_speed, dir);
		vSpeed = lengthdir_y(enemy_speed,dir);
		if(hSpeed !=0) image_xscale = -sign(hSpeed);
		
		//collide and commit to movement
		enemy_tile_collision();
	}
	else{
		x=xTo;
		y=yTo;
	}
	if(image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number){
		instance_destroy();
	}
	
	
}