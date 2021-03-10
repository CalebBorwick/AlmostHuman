
// Inherit the parent event
event_inherited();
collsionMap = layer_tilemap_get_id(layer_get_id("col"));
state = ENEMYSTATE.WANDER;

//Enemy Sprites
spr_move = spr_blood_slime;
spr_attack = spr_blood_slime_attack;
spr_hurt = spr_blood_slime_hurt;
spr_die = spr_blood_slime_die;

//Enemy scripts
enemy_scripts[ENEMYSTATE.WANDER] = blood_slime_wander;
enemy_scripts[ENEMYSTATE.CHASE] = blood_slime_chase;
enemy_scripts[ENEMYSTATE.ATTACK] = blood_slime_attack;
enemy_scripts[ENEMYSTATE.HURT] = blood_slime_hurt;
enemy_scripts[ENEMYSTATE.DIE] = blood_slime_die;