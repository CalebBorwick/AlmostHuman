if (!global.gamePaused){
	if(bounce_count !=0){
		bounce += (pi *bounce_speed);	
		if (bounce >pi){
			bounce -= pi;
			bounce_height *=0.6;
			bounce_count --;
		}
		z =abs(sin(bounce))*bounce_height; 
	}
	
	else z=0;
	
	//deteriorate 
	deteriorate++
	if(deteriorate> deteriorate_after){
		image_alpha -= deteriorate_time;
		if(image_alpha <=0) instance_destroy();
		
	}
	
	//friction
	fric =0.05;
	if (z==0) fric = 0.10;
	
	//move
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	
	if (tilemap_get_at_pixel(collsionMap, x, y)>0) spd = 0;
	spd = max(spd-fric,0);
}