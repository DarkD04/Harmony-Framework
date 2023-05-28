function set_color_grading(texture, size){
	//Get the shader that will be used
	var shader = shd_color_grading
	
	//Get shader uniforms
	var u_lut_tex = shader_get_sampler_index(shader, "lut_tex");
	var u_size = shader_get_uniform(shader, "size");
	
	//Get LUT texture
	var lut_tex	= sprite_get_texture(texture, 0);
	
	//Set the shader
	shader_set(shader);
	
	//Set shader uniforms
	shader_set_uniform_f(u_size, size);
	texture_set_stage(u_lut_tex, lut_tex);
}