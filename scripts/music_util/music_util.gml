function music_add(music_id, sound_id, loop_start = 0.00, loop_end = 0.00, loop = true)
{
	if !ds_map_exists(global.music_map, music_id){
		ds_map_add(global.music_map, music_id, array_create(4))	
		global.music_map[? music_id][0] = sound_id
		global.music_map[? music_id][1] = loop_start
		global.music_map[? music_id][2] = loop_end
		global.music_map[? music_id][3] = loop
	} else {
		//trace("ALERT: Your are trying to add a music track that already exsits.")
	}
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
		
		//show_debug_message( global.music_map[? music_id][0])
		//show_debug_message( global.music_map[? music_id][1])
		//show_debug_message( global.music_map[? music_id][2])
		//show_debug_message( global.music_map[? music_id][3])
		
		//Set the loop points
		loop_start[channel] = global.music_map[? music_id][1];
		loop_end[channel] = global.music_map[? music_id][2];
		
		//Play the sound
		play_data[channel] = audio_get_name(global.music_map[? music_id][0]);
		playing[channel] = audio_play_sound(global.music_map[? music_id][0], 0, global.music_map[? music_id][3]);
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
		if(playing[Jingle] && general_fade_multiplier == 1)
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