
// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
spr_move = spr_patient_move;
spr_attack = spr_patient_attack;
spr_hurt = spr_patient_hurt;
spr_die = spr_patient_die;

//Enemy scripts
enemy_scripts[ENEMYSTATE.WANDER] = patient_wander;
enemy_scripts[ENEMYSTATE.CHASE] = patient_chase;
enemy_scripts[ENEMYSTATE.ATTACK] = patient_attack;
enemy_scripts[ENEMYSTATE.HURT] = patient_hurt;
enemy_scripts[ENEMYSTATE.DIE] = patient_die;