	var df;
	
	//Make zaza
	for (var i = 0; i < 256; ++i) {
		df[i] = 8 * dsin((360/256)*i);
	}
	
	//Set the zaza
	//surface_deform(426, 240, df, global.object_timer*2);
	
	//Draw zaza background
	draw_sprite(spr_levsel_bg, image_index, 0, 0);
	
	//no more zaza
	shader_reset();
	
	//Draw rotating bg
	var scale = 1 + 0.5 * dcos(global.object_timer/4)
	var rainbow = make_color_hsv ((global.object_timer/5) mod 255,255,255);
	//draw_sprite_ext(spr_checkerbg, 0, (global.window_width/2) + 32 * dcos(global.object_timer), (global.window_height/2) + 32 * dsin(global.object_timer), scale, scale, 180 * dsin(global.object_timer/2), rainbow, 0.6 + 0.3 * dsin(global.object_timer/2))
	
	//Set the font to use
	draw_set_font(global.text_random);
	
	//Wave text!
		var DevText = string_upper(quotes[quote_index]);
		for(var i = 0; i < string_length(DevText); i++)
		{
			var size;
			size = string_width(string_copy(DevText, 0, i));
			draw_text(floor(((global.window_width/2)-string_width(DevText)/2)+size), floor((global.window_height/2)-96+(8*dsin((current_time/3)+24*i))), string_char_at(DevText , i+1));
		}
			
	//Change the text alingment
	draw_set_halign(fa_left);
	
	
	//Get zone array size
	var zone_arr = array_length(zone_list);
	
	//Draw list
	for(var i = 0; i < zone_arr; ++i) {
		//Do the selection
		if(i == zone_sel)
		{
			palette_swap(tex_pal_textselect1, 1);
		}
		
		//Draw zones
	    draw_text((global.window_width / 2)-128, ((global.window_height/2) - 64)+14*i, zone_list[i][0]);
		
		//Draw act text
		draw_text((global.window_width / 2)+64-16, ((global.window_height/2) - 64)+14*i, "ACT:");
		
		//Draw acts
		for(var j = 0; j < array_length( zone_list[i]) - 1; ++j) {
			//Do the selection
			if(i == zone_sel && j == act_sel)
			{
				palette_swap(tex_pal_textselect1, 1);
			}else
			{
				shader_reset();
			}
			draw_text((global.window_width / 2)+96+ (12*j)-16 , ((global.window_height/2) - 64)+14*i, string(j+1));
			shader_reset();
		}
	}
	
	//Draw sound test
	if(zone_sel == zone_arr) palette_swap(tex_pal_textselect1, 1);
	draw_text((global.window_width / 2)-128, (global.window_height/2) + 64+24, "SOUND TEST: ");
	draw_text((global.window_width / 2)+ 96-16, (global.window_height/2) +64+24, (sound_sel > 9 ? "" : "0") + string(sound_sel));
	shader_reset();