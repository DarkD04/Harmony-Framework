/// @description Script

	//Fade to room
	if(fade_room != noone)
	{
		if(fade_timer == 0)
		{
			//Switch the rooms
			room_goto(fade_room);
			
			//Reset room fade
			fade_room = noone;	
		}
	}
	
	//Reset the flag
	fade_reset = true;
	
	//Add fade timer depending on the type
	fade_timer += (fade_speed * (512/100)) * fade_type;
	
	//Limit the fade
	fade_timer = clamp(fade_timer, 0, 512);