function player_state_skid(){
	//Get input presses
	var mov = hold_right - hold_left;
	
	//Trigger the state
	if(state == ST_NORMAL && mov = -sign(ground_speed) && ground && abs(ground_speed) > 4 && sign(ground_speed) == facing && mode == 0 && control_lock == 0)
	{
		//Play animation
		animation_play(animator, ANIM_SKID);
		
		//Play the skid sound
		play_sound(sfx_skid);
		
		//Reset the skid timer and update the state
		skid_timer = 0;
		state = ST_SKID;
	}

	//If not skidding stop
	if(state != ST_SKID) 
	{
		exit;
	}
	
	//Create dust effect
	if(global.object_timer mod 4 = 0 && animation_is_playing(animator, ANIM_SKID)) 
	{
		if(global.chaotix_dust_effect)
		{
			create_effect(x - hitbox_w * -facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, irandom_range(0.4, 1.2) * facing, -2, 0, 0.15);
		}
		else
		{
			create_effect(x - hitbox_w * -facing, y + hitbox_h, spr_effects_dust, 0.2, depth-1, 0, 0, 0, 0);	
		}
	}
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Add timer
	if(mov == facing || mov == 0 || mode != 0) 
	{
		skid_timer++;
	}
	
	//Return to normal state in some cases
	if(skid_timer > 16 || !ground || ground_angle > 80 && ground_angle < 180 || ground_angle > 180 && ground_angle < 360-80)
	{
		state = ST_NORMAL;
	}
	
	//Decelerate
	if(mov == -facing) 
	{
		ground_speed = approach(ground_speed, -1 * facing, 0.5);
	}
	else 
	{
		ground_speed = approach(ground_speed, -1 * facing, friction_speed);
	}
	
	//Change the animation to skid turn
	if(!animation_is_playing(animator, ANIM_SKIDTURN))
	{
		if(ground_speed >= -1 && ground_speed <= -0.5 && animation_is_playing(animator, ANIM_SKID) && facing == 1||
		ground_speed >= 0.5 && ground_speed <= 1 && animation_is_playing(animator, ANIM_SKID) && facing == -1) 
		{
			animation_play(animator, ANIM_SKIDTURN);
		}
	}
	//Done
	if(animation_is_playing(animator, ANIM_SKIDTURN) && animation_has_finished(animator))
	{
		animation_play(animator, ANIM_WALK);
		state = ST_NORMAL;
		facing *= -1;
		ground_speed = 1 * facing;
	}
}