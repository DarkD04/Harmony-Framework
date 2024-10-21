	/// @description Draw the effect
	if palette 
	{
		palette_swap(palette_texture, palette_index)	
	}

	gpu_set_blendmode(blend);
	draw_self_floor();
	gpu_set_blendmode(bm_normal)
	shader_reset()