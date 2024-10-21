function player_state_peelout(){
	//If global value for peelout is diabled don't execute
	if(!global.use_peelout) 
	{
		exit;
	}
	
	//Trigger peel out
	if(state == ST_LOOKUP && press_action && ground && character == CHAR_SONIC)
	{
		play_sound(sfx_peelout_charge);
		state = ST_PEELOUT
		spindash_rev = 0;
	}
	
	//if its not peel out stop
	if(state != ST_PEELOUT) exit;
	
	//Create dust effect
	if(global.object_timer mod 3 == 0 && global.chaotix_dust_effect) 
	{
		create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (3 * facing) * dcos(random_range(180, 270)), 3 * dsin(random_range(180, 270)));
	}
	
	//Stop movement
	ground_speed = 0;
	
	//Change flags
	direction_allow = 1 - ground;
	movement_allow = 1 - ground;
	
	//Add rev value and clamp it
	spindash_rev += 1;
	spindash_rev = min(spindash_rev, 30);
	
	//Temp value for animation
	var anim = ANIM_WALK;
	
	//Change animations
	anim = ANIM_WALK;
	if(spindash_rev >= 15) 
	{
		anim = ANIM_RUN;
	}
	if(spindash_rev = 30) 
	{
		anim = ANIM_MAXRUN;
	}
	
	//Play the animations
	animation_play(animator, anim);
	
	//Release the peel out
	if(!hold_up)
	{
		//Stop the peelout charge audio
		audio_stop_sound(sfx_peelout_charge);
		
		//Play the release sound
		play_sound(sfx_peelout_release);
		
		//Set player's speed and back to normal state
		ground_speed = (2+(spindash_rev / 2.9)) * facing;
		if(!ground)
		{
			x_speed = (2+(spindash_rev / 2.9)) * facing;
		}
		state = ST_NORMAL;	
	}
}