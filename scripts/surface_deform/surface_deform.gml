function surface_deform(width, height, deform_data, offset, mode = 0){
	//Surface deform argument description
	/*
		width - The width of the surface;
		height - The height of the surface;
		deform_data - an array of line offsets
		offset - offset for the lines to move (Apply camera position so scrolling won't be weird)
		mode - there are different modes for distortion, mode 0 is for horizontal line offset and mode 1 is for vertical line offset
	*/

	//Get the shader uniforms
	var dist = shader_get_uniform(shd_line_dist, "dist");
	var size = shader_get_uniform(shd_line_dist, "size");
	var array_size = shader_get_uniform(shd_line_dist, "array_size");
	var off = shader_get_uniform(shd_line_dist, "offset");
	var m = shader_get_uniform(shd_line_dist, "mode");
	
	//Apply the shader
	shader_set(shd_line_dist);
	
	//Apply the shader uniforms
	shader_set_uniform_f_array(dist, deform_data);
	shader_set_uniform_f(size, width, height);
	shader_set_uniform_f(off, offset);
	shader_set_uniform_f(m, mode);
	shader_set_uniform_f(array_size, array_length(deform_data));
}