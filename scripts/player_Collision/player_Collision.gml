
function player_Collision(){
	var _collision =false;
	var _entity_list = ds_list_create();
	
	//horizontal tiles
	if (tilemap_get_at_pixel(collisionMap, x +hSpeed, y)){
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1){
			x+= TILE_SIZE -1;
		}
		hSpeed = 0;
		_collision = true
	}
	
	//horizontal entities
	var _entity_count = instance_position_list(x+hSpeed, y, pr_entity, _entity_list, false);
	var _snapX;
	while(_entity_count >0){
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision ==true){
			//move close
			if(sign(hSpeed) == -1) _snapX = _entity_check.bbox_right+3;
			else _snapX = _entity_check.bbox_left-3;
			x =_snapX;
			_collision = true;
			_entity_count=0;
			
		}
		ds_list_delete(_entity_list,0);
		_entity_count--;
	}
	
	//horizontal movement commit
	x+=hSpeed;
	
	ds_list_clear(_entity_list);
	//vertical tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed)){
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1){
			y+= TILE_SIZE -1;
		}
		vSpeed = 0;
		_collision = true
	}
	
	//vertical entities
	var _entity_count = instance_position_list(x, y+vSpeed, pr_entity, _entity_list, false);
	var _snapY;
	while(_entity_count >0){
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision ==true){
			//move close
			if(sign(vSpeed) == -1) _snapY = _entity_check.bbox_bottom+3;
			else _snapY = _entity_check.bbox_top-3;
			y =_snapY;
			_collision = true;
			_entity_count=0;
			
		}
		ds_list_delete(_entity_list,0);
		_entity_count--;
	}
	
	
	//vertical movement commit
	y+=vSpeed;
	
	ds_list_destroy(_entity_list);
	
	return _collision;
}