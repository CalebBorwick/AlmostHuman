
// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites
spr_move = spr_bloody_patient_move_boss;
spr_attack = spr_bloody_patient_attack_boss;
spr_hurt = spr_bloody_patient_hurt_boss;
spr_die = spr_bloody_patient_die_boss;

//Enemy scripts
enemy_scripts[ENEMYSTATE.WANDER] = patient_wander;
enemy_scripts[ENEMYSTATE.CHASE] = patient_chase;
enemy_scripts[ENEMYSTATE.ATTACK] = patient_attack;
enemy_scripts[ENEMYSTATE.HURT] = patient_hurt;
enemy_scripts[ENEMYSTATE.DIE] = patient_die;