//used to do slash 
function attack_slash(){
	//started attack
	if(sprite_index != spr_player_attack_slash){
		sprite_index = spr_player_attack_slash;
		localFrame = 0;
		image_index = 0;
		
		//clear hit list
		if (!ds_exists(hit_by_attack, ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
		
	}
	
	script_execute(calc_attack, spr_player_attack_slash_hb);
	
	//update sprite
	script_execute(player_Animate_Sprite);
	if(animationEnd){
		state = player_state_free;
		animationEnd = false;
	}
}

function attack_spin(){
	if(sprite_index != spr_player_attack_spin){
		sprite_index = spr_player_attack_spin;
		localFrame = 0;
		image_index = 0;
		//clear hit list
		if (!ds_exists(hit_by_attack, ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
		
	}
	
	script_execute(calc_attack, spr_player_attack_spin_hb);
	
	//update sprite
	var _totalFrames = sprite_get_number(sprite_index);
	image_index = localFrame + (CARDINAL_DIR * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	}else animationEnd = false; 
	
	if(animationEnd){
		state = player_state_free;
		animationEnd = false;
	}
}

// use attack hit box and check for hits
function calc_attack(mask){
	mask_index = mask;
	var _hit_by_attack_now = ds_list_create();
	var _hits = instance_place_list(x,y, pr_entity,_hit_by_attack_now, false);
	if(_hits>0){
		for (var i =0; i<_hits; i++){
			var _hitID = _hit_by_attack_now[| i];
			if(ds_list_find_index(hit_by_attack, _hitID) == -1){
				ds_list_add(hit_by_attack, _hitID);	
				with(_hitID){
					if(object_is_ancestor(object_index, pr_enemies)){
						hurt_enemy(id, 5, other.id, 10);	
					}
					else if(entity_hit_script != -1) script_execute(entity_hit_script)
					
				}
			}
		}
	}
	ds_list_destroy(_hit_by_attack_now);
	mask_index=spr_player;
}

function hurt_enemy(_enemy, _damage, _source, _knockback){
	with(_enemy){
		if (state != ENEMYSTATE.DIE){
			enemy_hp -= _damage;
			flash = 1;
			
			//die
			if(enemy_hp <=0){
				state = ENEMYSTATE.DIE;	
			}
			else{
				if (state != ENEMYSTATE.HURT) state_previous = state;
				state = ENEMYSTATE.HURT;
			}
			image_index = 0;
			if(_knockback != 0){
				var _knock_direction = point_direction(x,y,(_source).x, (_source).y);
				xTo = x- lengthdir_x(_knockback, _knock_direction);
				yTo = y -lengthdir_y(_knockback,_knock_direction);
			}
		}
	}
}