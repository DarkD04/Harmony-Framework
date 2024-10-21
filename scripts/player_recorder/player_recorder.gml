function player_recorder(){
	//Add recorder timer
	record_timer += 1;

	//Record position
	record_x[record_timer mod 60] = floor(x);
	record_y[record_timer mod 60] = floor(y);
	record_old_x[record_timer mod 60] = floor(xprevious);
	record_old_y[record_timer mod 60] = floor(yprevious);
	
	
	//Record animation
	record_sprite[record_timer mod 60] = animation_get_sprite(animator);
	record_frame[record_timer mod 60] = animation_get_frame(animator);
	
	//Recording visual
	record_direction[record_timer mod 60] = image_xscale;
	record_angle[record_timer mod 60] = image_angle;
	
}