/// draw health
var _player_health = global.player_health;
var _player_health_max = global.player_health_max;
var _player_health_frac = frac(_player_health);
_player_health -= _player_health_frac;

for (var i = 1; i<= _player_health_max; i++){
	var _image_index = (i > _player_health);
	if (i == _player_health +1){
		_image_index += (_player_health_frac >0);
		_image_index += (_player_health_frac >0.25);
		_image_index += ( _player_health_frac >0.5);
	}
	
	draw_sprite(spr_heart, _image_index, 4 +((i-1)*20), 4);
}