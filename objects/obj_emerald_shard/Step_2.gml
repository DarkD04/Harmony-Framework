if (collected) {
	hud_x += 16
	distance_stages = 0
	var _scale = 1 + (dcos(collected_counter * 8) * 0.22)
	image_xscale = _scale
	image_yscale = _scale
	visible = true
	if (collected_counter mod 4 == 0) {
		var _depth = dcos(collected_counter * 17) > 0 ? depth+1 : depth-1;
		create_effect(x + lengthdir_x(14, collected_counter * 17), y, spr_emerald_sparkle, 0.3,_depth,0,0,0,0.09375);	
	}
	
	collected_counter ++;
	if (collected_counter >= 50){
		if (FRAME_TIMER mod 2 == 0) {
			visible = false;
		} else {
			visible = true;
		}
	}
	
	if (collected_counter >= 80){
		instance_destroy();	
	}
	
	y = obj_player.y + y_offset -4
	x = obj_player.x
	y_offset += y_speed
	if y_speed < 0 {
		y_speed += 0.09375
	} else {
		y_speed = 0
	}
}