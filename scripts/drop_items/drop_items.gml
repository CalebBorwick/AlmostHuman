
function drop_items(){
	var _items = array_length_1d(argument2);
	if(_items >1){
		var _angle_per_item = 360/_items;
		var _angle = random(360);
		for (var i=0; i < _items; i++){
			with (instance_create_layer(argument0+i*10, argument1, "Instances", argument2[i])){
				direction = _angle;
				spd = 0.75 + (_items *0.1) +random(0.1);
			}
			_angle+=_angle_per_item;
		}
	}
	else instance_create_layer(argument0, argument1, "Instances", argument2[0]);
}

function drop_singular_item(){
	instance_create_layer(argument0 ,argument1,"Instances", argument2[0]);	
}