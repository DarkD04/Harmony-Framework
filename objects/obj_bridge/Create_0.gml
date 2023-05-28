/// @description Values
	log_amount = sprite_width / 16;
	current_segment = 0;
	max_dip = 0;
	stand_offset = 0;
	standing = false;
	for (var i = 0; i < log_amount; ++i) {
		frame[i] = 0;
		log_y[i] = y;
	}