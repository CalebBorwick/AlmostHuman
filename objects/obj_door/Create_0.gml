/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

// Form a unique identifier.
Identifier = string(room) + "_" + string(x) + "_" + string(y);

// Check if identifier is on the map.
if(!is_undefined(global.open_doors[? Identifier])){
    // Identifier was found, this enemy is already dead.
    image_index = 1;
	entity_collision = false;
	
}
else{
	image_index = 0;
	entity_collision = true;
}
// Inherit the parent event
event_inherited();

