function player_state_action(){
	//update sprite
	player_Animate_Sprite();
	
	if(animationEnd){
		state = player_state_free;
		animationEnd = false;
		if(animationEndScript != -1){
			script_execute(animationEndScript);	
			animationEndScript =-1;
		}
	}
}
	

function player_state_attack(){
	script_execute(state_attack);

}

function player_state_bonk(){
	hSpeed =lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	move_distance_remaining = max(0, move_distance_remaining - speedBonk);
	var _collided = player_Collision();
	
	//update sprite 
	sprite_index = spr_player_hurt;
	image_index = CARDINAL_DIR - 2;
	
	//change height
	z = sin (((move_distance_remaining / distanceBonk) *pi)) *distanceBonkHeight;
	
	
	//change state
	if (move_distance_remaining <=0){
		state = player_state_free;
	}
	
	
}
	
function player_state_free(){
	//Movements
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	script_execute(player_Collision);

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}else sprite_index = spriteIdle;

	if (_oldSprite != sprite_index) localFrame = 0;

	//Update image index
	script_execute(player_Animate_Sprite);
	
	//attack key logic
	if (keyAttack){
		state = player_state_attack;
		state_attack = attack_slash;
	}
	if(keyAttackAlt){
		state = player_state_attack;
		state_attack = attack_spin;
	}
	if(keyRoll){
		state = player_state_roll;
		move_distance_remaining = distanceRoll;
		}
		
	
	//activate logic
	if(keyActivate){
		//1. check for entity to activate
		//2. if nothing/no script then 
			//2a) if holding throw
			//2b)roll
		//3. if something and script activate
		//4. if the thing we activate is an npc make it face forward 
		
		var _activateX = x + lengthdir_x(10,direction);
		var _activateY = y + lengthdir_y(10,direction);
		var _activate_size = 4;
		var _activate_list = ds_list_create();
		activate = noone;
		var _entitie_found = collision_rectangle_list(
			_activateX - _activate_size,
			_activateY - _activate_size,
			_activateX + _activate_size,
			_activateY + _activate_size,
			pr_entity,
			false,
			true,
			_activate_list,
			true
			);
			
			while(_entitie_found >0){
				var _check =_activate_list[| --_entitie_found];
				if(_check !=global.iLift) && (_check.entity_activate_script != -1){
					activate= _check;
					break;
				}
			}
		
		
		ds_list_destroy(_activate_list);
		
		//roll if nothing else
		if (activate == noone){
			if(global.iLift != noone){
				player_throw();
			}
		}
		else {
			//activate entity
			script_execute_array(activate.entity_activate_script, activate.entity_activate_args);
			//make npc face player
			if(activate.entity_npc){
				with (activate){
					direction = point_direction(x,y,other.x,other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	
		
	}
	
}
	
function player_state_locked(){

}
	
function player_state_roll(){
	hSpeed =lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	move_distance_remaining = max(0, move_distance_remaining - speedRoll);
	var _collided = player_Collision();
	
	//update sprite 
	sprite_index = spr_player_roll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1-(move_distance_remaining / distanceRoll)) * _totalFrames), _totalFrames-1);
	
	
	//change state
	if (move_distance_remaining <=0){
		state = player_state_free;
	}
	
	if(_collided){
		state = player_state_bonk;
		move_distance_remaining = distanceBonk;
		script_execute(screen_shake, 3, 20);
	}
}
	
function player_state_transition(){
	player_Collision();
	
	player_Animate_Sprite();
}

function player_state_dead(){
	hSpeed = 0;
	vSpeed = 0;
	
	if( sprite_index != spr_player_dying) && (sprite_index != spr_player_died){
		sprite_index = spr_player_dying;
		image_index = 0;
		image_speed = 0.3;
		
	}
	if(image_index + image_speed > image_number){
		if (sprite_index == spr_player_dying){
			image_speed = max(0, image_speed -0.03);
			if(image_speed < 0.07){
					image_index =0;
					sprite_index = spr_player_died;
					image_speed = 1.0;
			}
		}
	
		else{
			image_speed =0;
			image_index = image_number -1;
			global.targetX = -1;
			global.targetY = -1;
			room_transition(TRANS_TYPE.SLIDE, r_lab);
		}
	}
	
}
	