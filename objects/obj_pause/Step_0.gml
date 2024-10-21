/// @description pause


	if(Input.StartPress || Input.ActionPress){
		if delay > 2 
		{
			//play_sound(sfx_pause);
			audio_resume_all();
			instance_activate_all();
			surface_free(pausemenu);
			pausemenu = -1;
			instance_destroy();
		}
	}
	
	delay += 1
	timer += 1