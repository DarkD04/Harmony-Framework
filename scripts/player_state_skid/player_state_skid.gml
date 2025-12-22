function player_state_skid(){
	
	var mov = hold_right - hold_left;
	
	//Create dust effect
	if(FRAME_TIMER mod 4 = 0 && animation_is_playing(animator, ANIM.SKID)) 
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
	
	//Trigger jump
	if(press_action && ground && !touching_ceiling && !force_roll)
	{
		//Change animation
		animation_play(animator, ANIM.ROLL);
		
		//Jump off the terrain
		y_speed -= jump_strength * dcos(ground_angle);	
		x_speed -= jump_strength * dsin(ground_angle);
			
		//Trigger the jump flag
		jump_flag = true;
			
		//Detach player off the ground and change state
		ground = false;
		state = player_state_jump
		dropdash_timer = 0;
		idle_timer = 0;
		//Change jump animation duration
		jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
		//Reset angle and floor mode
		ground_angle = 0;
		player_reposition_mode(CMODE_FLOOR);
			
		//Play the sound
		play_sound(sfx_jump);
		exit;
	}
	
	//Trigger rolling
	if(hold_down && abs(ground_speed) > 1 && ground)
	{

		//Play the rolling animation
		animation_play(animator, ANIM.ROLL);
		
		//Update the state
		if(!landed)
		{
			state = player_state_roll;
			idle_timer = 0;
			
			//Play the sound
			play_sound(sfx_roll);
		}
		exit;
	}
	
	//Return to normal state in some cases
	if(skid_timer > 16 || !ground || ground_angle > 80 && ground_angle < 180 || ground_angle > 180 && ground_angle < 360-80)
	{
		state = player_state_normal;
		exit;
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
	if(!animation_is_playing(animator, ANIM.SKIDTURN))
	{
		if(ground_speed >= -1 && ground_speed <= -0.5 && animation_is_playing(animator, ANIM.SKID) && facing == 1||
		ground_speed >= 0.5 && ground_speed <= 1 && animation_is_playing(animator, ANIM.SKID) && facing == -1) 
		{
			animation_play(animator, ANIM.SKIDTURN);
		}
	}
	//Done
	if(animation_is_playing(animator, ANIM.SKIDTURN) && animation_has_finished(animator))
	{
		animation_play(animator, ANIM.WALK);
		state = player_state_normal;
		facing *= -1;
		ground_speed = 1 * facing;
	}
}