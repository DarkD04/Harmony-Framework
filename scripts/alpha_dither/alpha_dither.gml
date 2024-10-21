function alpha_dither(dither_amount){
	
	//Get the shader uniform
	var uniform_alpha = shader_get_uniform(shd_alpha_dither, "dAlpha");
	
	//Set the shader itself
	shader_set(shd_alpha_dither);

	//Set the shader uniform
	shader_set_uniform_f(uniform_alpha, dither_amount);
}