
function enemy_tile_collision(){
	var _collision =false;
	
	//horizontal tiles
	if (tilemap_get_at_pixel(collsionMap, x +hSpeed, y)){
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1){
			x+= TILE_SIZE -1;
		}
		hSpeed = 0;
		_collision = true
	}
	
	
	//vertical tiles
	if (tilemap_get_at_pixel(collsionMap, x, y + vSpeed)){
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1){
			y+= TILE_SIZE -1;
		}
		vSpeed = 0;
		_collision = true
	}
	
	//horizontal movement commit
	x+=hSpeed;
	//vertical movement commit
	y+=vSpeed;
	
	return _collision;
}