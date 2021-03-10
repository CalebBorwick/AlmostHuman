draw_sprite(spr_shadow, 0, floor(x), floor(y));

if (invulnerable != 0) &&((invulnerable mod 8 <2) ==0) &&(flash==0){
		
}
else{
	if(flash!=0){
		shader_set(flash_shader);
		uFlash = shader_get_uniform(flash_shader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
	draw_sprite_ext(
					sprite_index,
					image_index,
					floor(x),
					floor(y-z),
					image_xscale,
					image_yscale,
					image_angle,
					image_blend,
					image_alpha
					)
	if (shader_current() != -1) shader_reset();
}