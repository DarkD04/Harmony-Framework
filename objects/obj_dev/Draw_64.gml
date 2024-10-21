	/// @description 
	display_set_gui_size(WINDOW_WIDTH * 2, WINDOW_HEIGHT * 2);
	if(show_player && !debug && instance_exists(obj_player))
	{
		if(!surface_exists(graded_surf))graded_surf = surface_create(WINDOW_WIDTH * 2, WINDOW_HEIGHT * 2);
	
		surface_set_target(graded_surf);
	
		var hd_w, hd_h;
		hd_w = WINDOW_WIDTH * 2;
		hd_h = WINDOW_HEIGHT * 2;
	

		draw_rectangle((hd_w-256) / 2, 16 / 2, (hd_w-16) / 2, (hd_h-16) / 2, false);
		gpu_set_colorwriteenable(1,1,1,0) //dont make the dumb bitch draw over the rest of the screen
		set_color_grading(tex_lut_debug, 64)
		surface_copy(graded_surf, 0, 0, application_surface); //get screen from before
		shader_reset(); //reset before it does anything else
		gpu_set_colorwriteenable(1,1,1,1)
	
		surface_reset_target();
	
		draw_surface_ext(graded_surf, 0, 0, 2, 2, 0, c_white, 1);
	
		draw_sprite(spr_hud_debug_header, 0, (hd_w-256), 16);
		
		//Draw text in rectangle
		draw_set_font(global.font_small);
		draw_set_halign(fa_center);
		draw_text(hd_w-((256+16)/2), 19, "PLAYER DEBUG")
		
		//Place info
		var info_text, info_result;
		info_text = ["X POSITION", "Y POSITION", "X SPEED", "Y SPEED", "GROUND SPEED", "GROUND ANGLE", "VISUAL ANGLE",
		"GROUND", "STATE INDEX", "SPRITE", "ANIMATION INDEX"];
		info_result = [string(obj_player.x), string(obj_player.y), string(obj_player.x_speed), string(obj_player.y_speed),
		string(obj_player.ground_speed), string(obj_player.ground_angle), string(obj_player.visual_angle),
		(obj_player.ground ? "TRUE" : "FALSE"), string(obj_player.state), string_upper(sprite_get_name(animation_get_sprite(obj_player.animator))), string(obj_player.animator.animation_current)];
		
		
		//Draw info
		draw_set_halign(fa_left);
		for (var i = 0; i < array_length(info_text); ++i) 
		{	
			draw_text(hd_w-252, 35 + 8*i, info_text[i] + ": " + info_result[i]);
		}
		
		var offy;
		
		offy = 8 * 15;
		
		//Draw text in rectangle
		draw_set_halign(fa_center);
		draw_text(hd_w-((256+16)/2), 19 + offy, "LEVEL DEBUG")
		
		//Place info
		info_text = ["STAGE NAME", "ACT NUMBER", "ACT TRANSITION", "TIMER TICKS"];
		info_result = [obj_level.stage_name, string(obj_level.act), obj_level.act_transition ? "TRUE" : "FALSE", string(global.stage_timer)];
		
		
		//Draw info
		draw_set_halign(fa_left);
		for (var i = 0; i < array_length(info_text); ++i) 
		{	
			draw_text(hd_w-252, offy + 35 + 8*i, info_text[i] + ": " + info_result[i]);
		}
		
		offy = 8 * 23;
		
		//Draw text in rectangle
		draw_set_halign(fa_center);
		draw_text(hd_w-((256+16)/2), 19 + offy, "GAME DEBUG")
		
		//Place info
		info_text = ["GAME NAME", "GAME VERSION", "BUILD DATE", "BUILD TIME", "FRAMERATE", "TRUE FPS", "OBJECTS NUMBER", "OBJECT TICKS", "MUSIC VOLUME", "SOUND VOLUME"];
		info_result = [string_upper(window_get_caption()), string(GM_version), date_date_string(GM_build_date), date_time_string(GM_build_date)
		, string(fps), string(store_truefps), string(instance_count), string(global.object_timer), string(floor(global.bgm_volume * 100)), string(floor(global.sfx_volume * 100))];
		
		
		//Draw info
		draw_set_halign(fa_left);
		for (var i = 0; i < array_length(info_text); ++i) 
		{	
			draw_text(hd_w-252, offy + 35 + 8*i, info_text[i] + ": " + info_result[i]);
		}
	}