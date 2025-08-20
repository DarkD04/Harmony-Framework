/// @description Script
	
	//Add timer
	timer++;
	
	//Play music
	if(timer == 48)
	{
		music_reset_fade();	
		play_music(MUSIC.J_GAME_OVER, 0);
	}
	
	//Slide in the thing
	if(timer >= 48)
	{
		offset = max(offset - 12, 0);
	}
	
	//Fade out
	if(timer == 560)
	{
		fade_change(FADE_OUT, 2,FADE_BLACK)
	}
	
	//Do the skip
	if(timer >= 64 && timer < 560)
	{
		if(Input.ActionPress || Input.StartPress)
		{
			music_set_fade(FADE_OUT, 2);
			timer = 560-1;
		}
	}
	
	//Restart
	if(timer == 650)
	{
		//Game over event
		if(type = 0)
		{
			reset_stage_data();
			game_restart();
		}else // Time over event
		{
			global.stage_timer = 0;
			room_restart();
		}
	}