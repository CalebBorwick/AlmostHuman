//initalize global
randomize();

global.gamePaused = false;
global.targetRoom =-1;
global.targetX = -1
global.targetY =-1;
global.targetDirection = 0; 
global.iLift =noone;
global.used_keycards = ds_map_create();
global.open_doors = ds_map_create();
global.used_health_caps = ds_map_create();
global.open_elevator = ds_map_create();
global.used_elevator_key = ds_map_create();
global.player_health_max = 3;
global.player_health = global.player_health_max;
global.start = 0;

global.iCamera = instance_create_layer(0,0,layer, obj_camera);

global.textSpeed = 0.75;

global.uUI = instance_create_layer(0,0,layer,obj_ui);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

room_goto(ROOM_START);

