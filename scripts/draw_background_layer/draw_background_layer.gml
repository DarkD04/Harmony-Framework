function draw_background_layer(background_layer)
{
	//Draw the background
	if(line_scroll[background_layer] = false)
	{
		//Act transition background offset adjustments
		if(trigger[background_layer])
		{
			//Horizontal offset
			var reposition_x =  ((camera_get_view_x(view_camera[view_current])*factor_x[background_layer]) + offset_x[background_layer])
			diff_x[background_layer] = reposition_x - camera_get_view_x(view_camera[view_current]);
			offset_x[background_layer] += offset_x[background_layer] - diff_x[background_layer]
			
			//Vertical offset
			var reposition_y =  ((camera_get_view_y(view_camera[view_current])*factor_y[background_layer]) + offset_y[background_layer])
			diff_y[background_layer] = reposition_y - camera_get_view_y(view_camera[view_current]);
			offset_y[background_layer] += offset_y[background_layer] - diff_y[background_layer]
			
			//Disable the trigger
			trigger[background_layer] = false;
		}
		
		//Normal scrolling
		pos_x[background_layer] = ((camera_get_view_x(view_camera[view_current])*factor_x[background_layer]) + offset_x[background_layer])
		pos_y[background_layer] = floor(camera_get_view_y(view_camera[view_current])*factor_y[background_layer] + offset_y[background_layer]);
		
		diff_x[background_layer] = pos_x[background_layer] - camera_get_view_x(view_camera[view_current]);
		diff_y[background_layer] = pos_y[background_layer] - camera_get_view_y(view_camera[view_current]);

		//Auto scrolling
		offset_x[background_layer] += speed_x[background_layer];
		offset_y[background_layer] += speed_y[background_layer];
		
		//Draw the background if the visibility flag is on
		if (visibility[background_layer] == true) 
		{
			draw_sprite_tiled_horizontal(background_sprite[background_layer], background_frame[background_layer], floor(pos_x[background_layer]), floor(pos_y[background_layer]), background_vertical[background_layer]);
		}
	}
	else
	{
		//Act transition background offset adjustments
		if(trigger[background_layer])
		{
			//Horizontal offset
			var reposition_x = ((camera_get_view_x(view_camera[view_current])*(factor_x[background_layer])) + offset_x[background_layer]);
			diff_x[background_layer] = reposition_x - camera_get_view_x(view_camera[view_current]);
			offset_x[background_layer] += offset_x[background_layer] - diff_x[background_layer]
			
			//Vertical offset
			var reposition_y =  ((camera_get_view_y(view_camera[view_current])*factor_y[background_layer]) + offset_y[background_layer])
			diff_y[background_layer] = reposition_y - camera_get_view_y(view_camera[view_current]);
			offset_y[background_layer] += offset_y[background_layer] - diff_y[background_layer]
			
			//Disable the trigger
			trigger[background_layer] = false;
		}
		
		//Normal scrolling
		pos_x[background_layer] = ((camera_get_view_x(view_camera[view_current])*(1-factor_x[background_layer])) - offset_x[background_layer]);
		pos_y[background_layer] = floor(camera_get_view_y(view_camera[view_current])*factor_y[background_layer] + offset_y[background_layer]);
		
		diff_x[background_layer] = ((camera_get_view_x(view_camera[view_current])*factor_x[background_layer]) + offset_x[background_layer]) - camera_get_view_x(view_camera[view_current])
		diff_y[background_layer] = (floor(camera_get_view_y(view_camera[view_current])*factor_y[background_layer]) + offset_y[background_layer]) - camera_get_view_y(view_camera[view_current])


		//Auto scrolling
		offset_x[background_layer] += speed_x[background_layer];
		offset_y[background_layer] += speed_y[background_layer];
		
		//Set the linescroll shader
		shader_set(shd_line_scroll);
		
		//Get shader's uniforms
		var BGWidth = shader_get_uniform(shd_line_scroll, "Width");
		var BGTexel = shader_get_uniform(shd_line_scroll, "TexelWidth");
		var OffX = shader_get_uniform(shd_line_scroll, "OffsetX");
		var PosX = shader_get_uniform(shd_line_scroll, "Position");
		var HeightY = shader_get_uniform(shd_line_scroll, "LineGaps");
		var StepY = shader_get_uniform(shd_line_scroll, "YSteps");
		var ScaleY = shader_get_uniform(shd_line_scroll, "YScale");
		var ShdHeight = shader_get_uniform(shd_line_scroll, "Height");
			
		//Set shader uniforms
		shader_set_uniform_f(BGWidth, sprite_get_width(background_sprite[background_layer]));
		shader_set_uniform_f(BGTexel, texture_get_texel_width(sprite_get_texture(background_sprite[background_layer], 0)));
		shader_set_uniform_f(OffX, pos_x[background_layer]);
		shader_set_uniform_f(PosX, camera_get_view_x(view_camera[view_current]), pos_y[background_layer]);
		shader_set_uniform_f(StepY, line_steps[background_layer]/(1-factor_x[background_layer]));
		shader_set_uniform_f(HeightY, line_gap[background_layer]);
		shader_set_uniform_f(ScaleY, bg_scale[background_layer]); 
		shader_set_uniform_f(ShdHeight, sprite_get_height(background_sprite[background_layer])); 
		
		//Draw the background if visibility flag is on
		if (visibility[background_layer] == true) 
		{
			draw_sprite_ext(background_sprite[background_layer], background_frame[background_layer], camera_get_view_x(view_camera[view_current]), floor(pos_y[background_layer]) , 1, bg_scale[background_layer], 0, c_white, 1);
		}
	}
	
	//Reset the shader
	shader_reset();
}