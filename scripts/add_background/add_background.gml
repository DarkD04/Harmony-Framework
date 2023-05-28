function add_background(background_id, sprite, frame, scroll_x, scroll_y, spd_x, spd_y, off_x, off_y, vertical_loop = false){
	bg_id = background_id;
	background_sprite[bg_id] = sprite;
	background_frame[bg_id] = frame;
	factor_x[bg_id] = scroll_x;
	factor_y[bg_id] = scroll_y;
	speed_x[bg_id] = spd_x;
	speed_y[bg_id] = spd_y;
	offset_x[bg_id] = off_x;
	offset_y[bg_id] = off_y;
	background_vertical[bg_id] = vertical_loop;
	line_scroll[bg_id] = false;
	trigger[bg_id] = false;
}

function add_background_line(background_id, sprite, frame, scroll_x, scroll_y, spd_x, spd_y, off_x, off_y, gaps, steps, y_scale = 1){
	bg_id = background_id;
	background_sprite[bg_id] = sprite;
	background_frame[bg_id] = frame;
	factor_x[bg_id] = scroll_x;
	factor_y[bg_id] = scroll_y;
	speed_x[bg_id] = spd_x;
	speed_y[bg_id] = spd_y;
	offset_x[bg_id] = off_x;
	offset_y[bg_id] = off_y;
	background_vertical[bg_id] = false;
	line_scroll[bg_id] = true;
	line_gap[bg_id] = gaps;
	line_steps[bg_id] = steps;
	bg_scale[bg_id] = y_scale;
	trigger[bg_id] = false;
}