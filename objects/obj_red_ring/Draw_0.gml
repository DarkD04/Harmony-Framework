/// @description Draw rings
	
	
	shader_set(shd_alpha_dither);
	shader_set_uniform_f(_uniAlpha, alpha_death);
	draw_self();
	shader_reset();