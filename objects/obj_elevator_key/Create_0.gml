/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

collsionMap = layer_tilemap_get_id(layer_get_id("col"));
// Form a unique identifier.
iden = string(room) + "_" + string(x) + "_" + string(y);
// Check if identifier is on the map.
if(!is_undefined(global.used_elevator_key[? iden])){
    // Identifier was found, this enemy is already dead.
    instance_destroy();
}

// Inherit the parent event

event_inherited();

