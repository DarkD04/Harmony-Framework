function player_state_knuxslide(){
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Change animation
	if(ground_speed != 0)
	{
		animation_play(animator, ANIM.KNUXSLIDE);
	}
	
	//Get grounded
	if(ground && ground_angle > 45 && ground_angle < 315)
	{
		state = player_state_normal;
		control_lock = 4;
		exit;
	}
	
	//Ground event
	if(ground)
	{
		//Decelerate
		ground_speed = approach(ground_speed, 0, 0.125);
		
		//Create dust effect
		if(FRAME_TIMER mod 8 == 0 && ground_speed != 0 && !landed)
		{
			play_sound(sfx_slide);
			create_effect(x+random_range(-8, 8), y + hitbox_h, spr_dust_effect, 0.4, depth-1, random_range(0.8, 1.2) * facing, -2, 0, 0.15);
		}
	}
	
	//Make knuckles fall if detached
	if(!ground)
	{
		state = player_state_knuxfall;	
		exit;
	}
	
	//Change animation
	if(ground_speed == 0) 
	{
		animation_play(animator, ANIM.KNUXGETUP);
	}
	
	//Reset the state
	if(animation_is_playing(animator, ANIM.KNUXGETUP) && animation_has_finished(animator)) 
	{
		state = player_state_normal;
		exit;
	}
}