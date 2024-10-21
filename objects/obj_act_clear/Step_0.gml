/// @description Script
	//Add timer
	timer += 1;
	
	//Force to victory state
	with(obj_player)
	{
		if(ground)
		{
			ground_speed = 0;
			input_disable = true;
			facing = 1;
			state = ST_NULL;
			animation_play(animator, ANIM_VICTORY);
		}
	}
	//Fade out
	if(timer = 1 && state = 0)
	{
		music_set_fade(FADE_OUT, 1)
	}
	
	//Play act clear music
	if(timer = 100 && state = 0)
	{
		music_reset_fade();
		play_music(J_ACT_CLEAR, 0);
	}
	
	//Move in card stuff
	if(state = 0)
	{
		if(timer >= 24)	offset_x[0] = max(offset_x[0]-12, 0);
		if(timer >= 32)	offset_x[1] = max(offset_x[1]-12, 0);
		if(timer >= 40)	offset_x[2] = max(offset_x[2]-12, 0);
		if(timer >= 48)	offset_x[3] = max(offset_x[3]-12, 0);
	}
	
	//Subtract from the count
	if(timer > 450 && state = 0){
		//Subtract time bonus
		if(time_bonus > 0) {
			time_bonus -= 100; 
			global.score += 100; 
			total_bonus += 100
		}
		
		//Subtract ring bonus
		if(ring_bonus > 0) {
			ring_bonus -= 100; 
			global.score += 100; 
			total_bonus += 100
		}
		
		//Play sound
		if(global.object_timer mod 4 = 0 && time_bonus > 0 || global.object_timer mod 4 = 0 && ring_bonus > 0)
			play_sound(sfx_scoreadd);
		
		//Skip the count down
		if(Input.ActionPress && time_bonus > 0){
			//Time bonus skip
			global.score += time_bonus; 
			total_bonus += time_bonus;
			time_bonus -= time_bonus; 
		}
		
		if(Input.ActionPress && ring_bonus > 0){
			//Ring bonus skip
			global.score += ring_bonus; 
			total_bonus += ring_bonus;
			ring_bonus -= ring_bonus; 
		}
		
		//No more count down, switch to ending events
		if(time_bonus = 0 && ring_bonus = 0){
			play_sound(sfx_scoretally);
			timer = 0;
			state = 1;
		}
	}
	
	//Stop executing if extra life jingle is playing
	if(state == 1 && audio_is_playing(j_extra_life) && timer >= 78) 
	{
		timer = 78;
	}
	
	//Ending events
	if(state = 1 && !obj_level.act_transition)
	{
		if(timer = 80)
		{
			obj_fade.fade_type = FADE_OUT;
			obj_fade.fade_speed = 5;
		}
		
		//Go to the next stage
		if(timer = 110)
		{
			reset_stage_data();
			room_goto(obj_level.next_level);
		}
	}
	
	if(state = 1 && obj_level.act_transition){
		//Move in card stuff
		if(timer >= 24+64)	offset_x[0] += 16;
		if(timer >= 32+64)	offset_x[1] += 16;
		if(timer >= 40+64)	offset_x[2] += 16;
		if(timer >= 48+64)	offset_x[3] += 16;
		
		//This is fun part for scarly
		if(!instance_exists(obj_act_transition) && timer > 148) instance_create_depth(0, 0, 0, obj_act_transition)
	}