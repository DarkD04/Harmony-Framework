function player_state_spindash(){
	//Trigger the spindash
	if(state = ST_LOOKDOWN && Input.ActionPress)
	{
		audio_sound_pitch(sfx_spindash, 1);
		spindash_rev = 0;
		animation = ANIM_SPINDASH;
		state = ST_SPINDASH;
	}
	
	//Stop executing if not spindashing
	if(state != ST_SPINDASH) exit;
	
	//Create dust effect
	if(global.object_timer mod 4 = 0) create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (2.5 * facing) * dcos(random_range(180, 270)), 2.5 * dsin(random_range(180, 270)));
	
	//Stop the movement
	ground_speed = 0;
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	attacking = true;
	
	//Change animation
	animation = ANIM_SPINDASH;
	
	//Rev up!
	if(Input.ActionPress)
	{
		play_sound(sfx_spindash);
		if(spindash_rev >= 2) audio_sound_pitch(sfx_spindash, 1 + spindash_rev / 10);
		animation_frame = 0;
		spindash_rev = min(spindash_rev + 2, 8);
	}
	
	//Release
	if(!Input.Down && ground)
	{
		audio_stop_sound(sfx_spindash);
		play_sound(sfx_release);
		ground_speed = (8+(floor(spindash_rev)/2)) * facing;
		state = ST_ROLL;
		obj_camera.h_lag = 20 - spindash_rev;
	}
}