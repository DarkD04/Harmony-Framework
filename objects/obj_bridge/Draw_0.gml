/// @description Draw logs
	//Don't render if off screen
	if(!on_screen()) exit;
	
	for (var i = 0; i < log_amount; ++i) {
		draw_sprite(sprite_index, frame[i], x + 16*i, log_y[i] + push_offset * i)
	}