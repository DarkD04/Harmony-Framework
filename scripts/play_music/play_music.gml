function play_music(music, channel, loopstart, loopend, loop = true){
	
	//Music macros
	#macro BGM 0
	#macro Jingle 1
	
	//Get the sound object
	with(obj_music){
		
		//Stop everything before BGM plays.
		if(channel = BGM)
			audio_stop_sound(playing[channel]);
		
		//Stop jingle
		audio_stop_sound(playing[Jingle]);
		
		//Restore jingle channel value
		playing[Jingle] = noone;

		
		//Set the loop points
		loop_start[channel] = loopstart;
		loop_end[channel] = loopend;
		
		//Play the sound
		playing[channel] = audio_play_sound(music, 0, loop);
		play_data[channel] = audio_get_name(music);
	}
}