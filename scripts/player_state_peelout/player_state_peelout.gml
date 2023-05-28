function player_state_peelout(){
	//Trigger peel out
	if(state = ST_LOOKUP && Input.ActionPress && ground)
	{
		play_sound(sfx_peelout_charge)
		state = ST_PEELOUT
		spindash_rev = 0;
	}
	
	//if its not peel out stop
	if(state != ST_PEELOUT) exit;
	
	//Create dust effect
	if(global.object_timer mod 3 = 0) create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (3 * facing) * dcos(random_range(180, 270)), 3 * dsin(random_range(180, 270)));
	
	//Stop movement
	ground_speed = 0;
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Add rev value and clamp it
	spindash_rev += 1;
	spindash_rev = min(spindash_rev, 30);
	
	//Change animations
	animation = ANIM_WALK;
	if(spindash_rev >= 15) animation = ANIM_RUN;
	if(spindash_rev = 30) animation = ANIM_MAXRUN;
	
	//Release the peel out
	if(!Input.Up)
	{
		audio_stop_sound(sfx_peelout_charge);
		play_sound(sfx_peelout_release);
		ground_speed = (2+(spindash_rev / 2.9)) * facing;
		state = ST_NORMAL;	
	}
}