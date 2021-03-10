/// @description Insert description here
// You can write your code in this editor
if(room == r_room2_floor1) || (room == r_roomBoss_floor1){
	if(instance_number(obj_blood_slime) <=1) && (instance_number(obj_blood_slime_med) == 0){
		event_inherited();
	}

}
// Inherit the parent event
