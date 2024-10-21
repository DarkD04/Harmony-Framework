function music_add(music_id, sound_id, loop_start = 0.00, loop_end = 0.00, loop = true)
{
	global.list_sound_id[music_id] = sound_id;			//Add sound ID to the list.
	global.list_loop_start[music_id] = loop_start;		//Add music loop start to the list, if value is 0.00 the loop will be set at the start of the music.
	global.list_loop_end[music_id] = loop_end;			//Add music loop end to the list, if value is 0.00 the loop will be set to the end of the music.
	global.list_loop[music_id] = loop;					//Add music loop flag to the list, it's used to make music loop or not
}

function music_fade_channel(channel, fade_type, fade_speed)
{

	obj_music.fade_speed[channel] = fade_speed;
	obj_music.fade_type[channel] = fade_type;	
}

function music_cross_fade(target_channel, fade_speed)
{
	for (var i = 0; i < obj_music.channel_size; ++i) 
	{
		if(target_channel != i)
		{
			obj_music.fade_speed[target_channel] = fade_speed;
			obj_music.fade_type[i] = FADE_OUT;
		}
	}
	
	obj_music.fade_speed[target_channel] = fade_speed;
	obj_music.fade_type[target_channel] = FADE_IN;	
}

function music_set_fade(fade_type, fade_speed)
{
	obj_music.general_fade_speed = fade_speed;
	obj_music.general_fade = fade_type;	
}

function music_reset_fade()
{
	music_set_fade(FADE_IN, 1);
	obj_music.general_fade_multiplier = 1;
}

function play_music(music_id, channel = 0){
	
	//Music macros
	#macro BGM 0
	#macro Jingle obj_music.channel_size - 1
	
	//Get the sound object
	with(obj_music)
	{
		
		//Stop everything before BGM plays.
		audio_stop_sound(playing[channel]);
		
		//Stop jingle
		audio_stop_sound(playing[Jingle]);
		
		//Restore jingle channel value
		playing[Jingle] = noone;

		//Set the loop points
		loop_start[channel] = global.list_loop_start[music_id];
		loop_end[channel] = global.list_loop_end[music_id];
		
		//Play the sound
		play_data[channel] = audio_get_name(global.list_sound_id[music_id]);
		playing[channel] = audio_play_sound(global.list_sound_id[music_id], 0, global.list_loop[music_id]);
	}
}

function play_music_priority(music_id, channel)
{
	for (var i = 0; i < obj_music.channel_size; ++i) 
	{
		if(channel != i)
		{
			obj_music.fade_multiplier[i] = 0;	
			obj_music.fade_type[i] = FADE_OUT;
		}
	}
	
	play_music(music_id, channel);
}

function stop_jingle(fade_music_in, fade_speed = 1){

	with(obj_music)
	{
		if(playing[Jingle])
		{
			//Fade into BGM (optional)
			if(fade_music_in = true)
			{
				general_fade = FADE_IN;
				general_fade_speed = fade_speed;
				general_fade_multiplier = 0;
			}
	
			//Stop the jingle here
			audio_stop_sound(playing[Jingle]);
			playing[Jingle] = noone;
			play_data[Jingle] = "";
		}
	}
}