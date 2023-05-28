function animation_system(){
	player_animation_list();
	//Stop the sprite from animating
	image_speed = 0;
	
	//Change sprite index to correct animation sprite:
	sprite_index = animation_sprite;
	
	//Force sprite frames to a value:
	image_index = animation_frame;
	
	//Reset animation frame:
	if(animation_previous != animation)
	{
		//Get previous animation
		animation_previous = animation;
	
		animation_frame = 0;	
		animation_speed = animation_set_speed;
	}
	
	//Add animation frames by animation speed:
	animation_frame += animation_speed;
	
	//Loop animation
	if(animation_frame >= image_number)
	{
		if(animation_loop) animation_frame = animation_loop_start; else animation_frame = image_number-1;
	}
}