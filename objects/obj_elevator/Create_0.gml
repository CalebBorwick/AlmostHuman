image_speed = 0;

// Form a unique identifier.
Identifier = string(room) + "_" + string(x) + "_" + string(y);

// Check if identifier is on the map.
if(!is_undefined(global.open_elevator[? Identifier])){
    // Identifier was found, this enemy is already dead.
    image_index = 12;
	entity_collision = false;
	
}
else{
	image_index = 0;
	entity_collision = true;
}

// Inherit the parent event
event_inherited();

