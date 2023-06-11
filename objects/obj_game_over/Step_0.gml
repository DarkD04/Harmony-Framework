/// @description Script
	
	//Add timer
	timer++;
	
	//Play music
	if(timer == 48)
	{
		obj_music.fade_speed = 100;
		obj_music.fade = MusicFadeIn;	
		play_music(j_game_over, BGM, 0, 0, false);
	}
	
	//Slide in the thing
	if(timer >= 48)
	{
		offset = max(offset - 12, 0);
	}
	
	//Fade out
	if(timer == 560)
	{
		obj_fade.fade_type = fade_out;
		obj_fade.fade_speed = 2;
	}
	
	//Do the skip
	if(timer >= 64 && timer < 560)
	{
		if(Input.ActionPress || Input.StartPress)
		{
			obj_music.fade_speed = 2;
			obj_music.fade = MusicFadeOut;
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