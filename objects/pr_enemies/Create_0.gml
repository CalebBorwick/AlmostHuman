
// Inherit the parent event
event_inherited();

//variables
state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed =0;
xTo = xstart;
yTo = ystart;
dir = 0;

time_passed = 0;
wait_duration = 60;
wait = 0;


aggro_check =0;
aggro_check_duration = 5;
state_target = state;
state_previous = state;
state_wait = 0;
state_wait_duration = 0;

//Enemey Sprite
spr_move = spr_blood_slime;

//enemy scripts
enemy_scripts[ENEMYSTATE.IDLE] = -1;
enemy_scripts[ENEMYSTATE.WANDER] = -1;
enemy_scripts[ENEMYSTATE.CHASE] = -1;
enemy_scripts[ENEMYSTATE.ATTACK] = -1;
enemy_scripts[ENEMYSTATE.HURT] = -1;
enemy_scripts[ENEMYSTATE.DIE] = -1;
enemy_scripts[ENEMYSTATE.WAIT] = enemy_wait;
