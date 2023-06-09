 function palette_swap(texture, index){
	//Get the shader
	var shader = shd_color_replacer;
	
	//Get shader uniforms
	var sampled_id = shader_get_sampler_index(shader, "u_sPalette");
	var u_coords = shader_get_uniform(shader, "u_vPalcoords");
	var u_size = shader_get_uniform(shader, "u_vSize");
	var u_index = shader_get_uniform(shader, "u_fIndex");
	var u_tolerance = shader_get_uniform(shader, "u_fTolerance");
	
	//Get values for shader
	var tex = sprite_get_texture(texture, 0);
	var coords = texture_get_uvs(tex);
	var size_w = texture_get_texel_width(tex);
	var size_h = texture_get_texel_height(tex);
	var tolerance = 0.004;
	
	//Get sprite height
	var height = sprite_get_height(texture)
	
	//Set the shader
	shader_set(shader);
	var ind
	ind = index mod (height-1);
	//ind = max(ind, 1);
	
	//Set the shader uniforms
	texture_set_stage(sampled_id, tex);
	shader_set_uniform_f(u_coords, coords[0], coords[1], coords[2], coords[3]);
	shader_set_uniform_f(u_size, size_w, size_h);
	shader_set_uniform_f(u_index, ind + 1);
	shader_set_uniform_f(u_tolerance, tolerance);
	
}