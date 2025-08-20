/// @description Draw the HUD

	//Don't render the hud
	if(!render)
	{
		exit;	
	}
	
	//Temp value
	var minute, sec, milsec, c, cx, cy;
	
	//Screen values
	c = view_camera[view_current]
	cx = camera_get_view_x(c)
	cy = camera_get_view_y(c)
	
	//Time
	milsec = floor(global.stage_timer/10) mod 100;
	sec = floor(global.stage_timer/1000) mod 60;
	minute = floor(global.stage_timer/60000);
	
	//Draw whole ass water
	if(!surface_exists(surf)) surf = surface_create(global.window_width, global.window_height);
	
		
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	//Draw normal text
	draw_sprite(spr_hudtext, 0, 16 + offset[0], 8);
	draw_sprite(spr_hudtext, 1, 16 + offset[1], 24);
	draw_sprite(spr_hudtext, 2, 16 + offset[2], 40);
	
	//Red flashing text
	if(global.rings == 0 && global.object_timer mod 20 < 20/2) draw_sprite(spr_hudtext, 4, 16 + offset[2], 40);
	if(global.stage_timer >= 540000 && global.object_timer mod 20 < 20/2) draw_sprite(spr_hudtext, 3, 16 + offset[1], 24);
	
	//Draw life icon
	draw_sprite(spr_hud_life_icons, global.character, 16 + offset[3], global.window_height - 26);
	
	//Set font numbers
	draw_set_font(global.hud_number);
	draw_set_halign(fa_right);
	
	//Draw number
	draw_text(120 + offset[0], 9, string(global.score));
	draw_text(120 + offset[1], 25, string(minute)+" "+(sec > 9 ? "" : "0") + string(sec)+" "+(milsec > 9 ? "" : "0") + string(milsec));
	draw_text(96 + offset[2], 41, string(global.rings));
	draw_text(56 + offset[3], global.window_height - 24, (global.life > 9 ? "" : "0") + string(global.life));
	
	if (ds_map_exists(global.red_ring_map, obj_level.stage_name)) {
		var i = 0;
		repeat(obj_level.red_ring_count) {
			if (global.red_ring_map[? obj_level.stage_name][i] == 1){
				draw_sprite(spr_red_ring_hud,0,global.window_width -offset[3] - 10 - (obj_level.red_ring_count * 16) + (i * 16),  global.window_height - 18);
				//show_debug_message("happening")
			} else {
				draw_sprite(spr_red_ring_hud,1,global.window_width -offset[3] - 10 - (obj_level.red_ring_count * 16) + (i * 16),  global.window_height - 18);
			}
			i++;
		}
	}
	
	if instance_exists(obj_emerald_shard) {
		var ico_sx = global.window_width / 2
		var ico_sy = global.window_height - 24
		//awesome code i stole from gamemaker forms kinda, for monitor icond display
		var ico_size = 16; // size of the sprite
		var ico_padding = 2; // size of the space between each sprite

		var ico_max_width = (ico_size+ico_padding) * 1; // calculates the biggest the width can be (as flyingsaucerinvasion suggested)
		var ico_my_width = (ico_size+ico_padding) *instance_number(obj_emerald_shard); // calculates the width of just this row
		var ico_offset = (ico_max_width - ico_my_width) / 2;
		
		
		for(var j=0; j<instance_number(obj_emerald_shard); j++) {
			 var obj = instance_find(obj_emerald_shard,j);
		 
		     var dx = ico_sx + j * (ico_size+ico_padding) + ico_offset;
			 var ico_posy = ico_sy
			 draw_sprite(spr_emerald_radar, obj.distance_stages, dx, ico_posy - offset[3])
		}
		
		var closest = instance_nearest(obj_player.x, obj_player.y, obj_emerald_shard)
		
		if (!closest.collected && !obj_player.input_disable) {
			switch closest.distance_stages{
				case 1:
					if (global.object_timer mod 60 == 0) {
						play_sound(sfx_radar_ding);
					}
				break;
				case 2:
					if (global.object_timer mod 30 == 0) {
						play_sound(sfx_radar_ding);
					}
				break;
				case 3:
					if (global.object_timer mod 15 == 0) {
						play_sound(sfx_radar_ding);
					}
				break;
				case 4:
					if (global.object_timer mod 10 == 0) {
						play_sound(sfx_radar_ding);
					}
				break;
				case 5:
					if (global.object_timer mod 5 == 0) {
						play_sound(sfx_radar_ding);
					}
				break;
				default:
				
				break;
			}
		}
	}
	
	surface_reset_target();
	
	draw_surface(surf, cx, cy);
	
	
	if(slide_in)
	{
		for(var i = 0; i <= 3; i++)
		{
			var debug_offset = 0;
			if(instance_exists(obj_dev)) debug_offset = -128 * obj_dev.debug;
			offset[i] = approach(offset[i], debug_offset, 8);	
		}
	}
	
