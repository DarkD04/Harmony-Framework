function player_state_skid(){
	
	var mov = hold_right - hold_left;
	
	//Create dust effect
	if(global.object_timer mod 4 = 0 && animation_is_playing(animator, ANIM.SKID)) 
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
		state = player_state_normal;
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