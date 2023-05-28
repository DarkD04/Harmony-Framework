function player_recorder(){
	//Add recorder timer
	record_timer += 1;

	//Record position
	record_x[record_timer mod 60] = floor(x);
	record_y[record_timer mod 60] = floor(y);
	
	//Record animation
	record_sprite[record_timer mod 60] = animation_sprite;
	record_frame[record_timer mod 60] = animation_frame;
	
	//Recording visual
	record_direction[record_timer mod 60] = image_xscale;
	record_angle[record_timer mod 60] = image_angle;
	
}