
// Form a unique identifier.
health_cap_iden = string(room) + "_" + string(x) + "_" + string(y);
// Check if identifier is on the map.
if(!is_undefined(global.used_health_caps[? health_cap_iden])){
    // Identifier was found, this enemy is already dead.
    instance_destroy();
}

// Inherit the parent event
event_inherited();

