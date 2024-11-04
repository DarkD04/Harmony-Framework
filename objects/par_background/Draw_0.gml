/// @description Draw background
	for(var i = 0; i < bg_id; i++)
	{
		//Draw the background
		if(line_scroll[i] = false)
		{
			if(trigger[i])
			{
				var reposition_x =  ((camera_get_view_x(view_camera[view_current])*factor_x[i]) + offset_x[i])
				diff_x[i] = reposition_x - camera_get_view_x(view_camera[view_current]);
				offset_x[i] += offset_x[i] - diff_x[i]
				
				var reposition_y =  ((camera_get_view_y(view_camera[view_current])*factor_y[i]) + offset_y[i])
				diff_y[i] = reposition_y - camera_get_view_y(view_camera[view_current]);
				offset_y[i] += offset_y[i] - diff_y[i]

				trigger[i] = false;
			}
		
			//Normal scrolling
			pos_x[i] = ((camera_get_view_x(view_camera[view_current])*factor_x[i]) + offset_x[i])
			pos_y[i] = floor(camera_get_view_y(view_camera[view_current])*factor_y[i] + offset_y[i]);
		
			diff_x[i] = pos_x[i] - camera_get_view_x(view_camera[view_current]);
			diff_y[i] = pos_y[i] - camera_get_view_y(view_camera[view_current]);


			//Auto scrolling
			offset_x[i] += speed_x[i];
			offset_y[i] += speed_y[i];
			if (visibility[i] == true) draw_sprite_tiled_horizontal(background_sprite[i], background_frame[i], floor(pos_x[i]), floor(pos_y[i]), background_vertical[i]);
		}else
		{
			if(trigger[i])
			{
				var reposition_x = ((camera_get_view_x(view_camera[view_current])*(factor_x[i])) + offset_x[i]);
				diff_x[i] = reposition_x - camera_get_view_x(view_camera[view_current]);
				offset_x[i] += offset_x[i] - diff_x[i]
				
				var reposition_y =  ((camera_get_view_y(view_camera[view_current])*factor_y[i]) + offset_y[i])
				diff_y[i] = reposition_y - camera_get_view_y(view_camera[view_current]);
				offset_y[i] += offset_y[i] - diff_y[i]
				
				trigger[i] = false;
			}
		
			//Normal scrolling
			pos_x[i] = ((camera_get_view_x(view_camera[view_current])*(1-factor_x[i])) - offset_x[i]);
			pos_y[i] = floor(camera_get_view_y(view_camera[view_current])*factor_y[i] + offset_y[i]);
		
			diff_x[i] = ((camera_get_view_x(view_camera[view_current])*factor_x[i]) + offset_x[i]) - camera_get_view_x(view_camera[view_current])
			diff_y[i] = (floor(camera_get_view_y(view_camera[view_current])*factor_y[i]) + offset_y[i]) - camera_get_view_y(view_camera[view_current])


			//Auto scrolling
			offset_x[i] += speed_x[i];
			offset_y[i] += speed_y[i];
			
			
			shader_set(shd_line_scroll)
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
			shader_set_uniform_f(BGWidth, sprite_get_width(background_sprite[i]));
			shader_set_uniform_f(BGTexel, texture_get_texel_width(sprite_get_texture(background_sprite[i], 0)));
			shader_set_uniform_f(OffX, pos_x[i]);
			shader_set_uniform_f(PosX, camera_get_view_x(view_camera[view_current]), pos_y[i]);
			shader_set_uniform_f(StepY, line_steps[i]/(1-factor_x[i]));
			shader_set_uniform_f(HeightY, line_gap[i]);
			shader_set_uniform_f(ScaleY, bg_scale[i]); 
			shader_set_uniform_f(ShdHeight, sprite_get_height(background_sprite[i])); 
			
			if (visibility[i] == true) draw_sprite_ext(background_sprite[i], background_frame[i], camera_get_view_x(view_camera[view_current]), floor(pos_y[i]) , 1, bg_scale[i], 0, c_white, 1);
		}
		shader_reset()
	}