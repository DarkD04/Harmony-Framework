function animation_system(){

	if (animation_legacy = true)
	{
		if(animation_previous != animation)
		{
			//Get previous animation
			animation_previous = animation;
			animation_set_speed = animation_set_duration;
			animation_speed = animation_set_speed;
			animation_frame = 0;	
		}
	
		//Add animation frames by animation speed:
		if (animation_speed) > 0
		{
			animation_speed -= 1
		}
		else
		{	
			animation_frame += 1;
		
			if(animation_frame > image_number -1)
			{
				if(animation_loop) animation_frame = animation_loop_start; else animation_frame = image_number-1;
			}
			animation_speed = animation_set_speed;
		}

	}
	//ORDER IS A LITTLE BIT FUCKED UP BUT DONT KILL ME PLZ :((

		//Stop the sprite from animating
		image_speed = 0;
	
		//Change sprite index to correct animation sprite:
		sprite_index = animation_sprite;
	
		//Force sprite frames to a value:
		image_index = animation_frame;

	if (animation_legacy = false)
	{
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
}