/// @description Stop everything
	
	audio_stop_all();
	
	//Reset everything
	for (var i = 0; i < channel_size; ++i) 
	{
		playing[i] = noone;
		loop_start[i] = 0.00;
		loop_end[i] = 0.00;
		play_data[i] = "";
		fade_multiplier[i] = 1;
		fade_speed[i] = 1;
		fade_type[i] = FADE_IN;
	}
	
	//Values for general fade
	general_fade = FADE_IN;
	general_fade_speed = 1;
	general_fade_multiplier = 1;
