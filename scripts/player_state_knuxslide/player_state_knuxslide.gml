function player_state_knuxslide(){
	//If not sliding stop executing
	if(state != ST_KNUXSLIDE) exit;
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Change animation
	if(ground_speed != 0)animation = ANIM_KNUXSLIDE;
	
	//Get grounded
	if(ground && ground_angle > 45 && ground_angle < 315)
	{
		state = ST_NORMAL;
		control_lock = 4;
	}
	
	//Ground event
	if(ground)
	{
		//Decelerate
		ground_speed = approach(ground_speed, 0, 0.125);
		
		//Create dust effect
		if(global.object_timer mod 8 == 0 && ground_speed != 0)
		{
			play_sound(sfx_slide);
			create_effect(x+random_range(-8, 8), y + hitbox_h, spr_dust_effect, 0.4, depth-1, random_range(0.8, 1.2) * facing, -2, 0, 0.15);
		}
	}
	
	//Change animation
	if(ground_speed == 0) animation = ANIM_KNUXGETUP;
	
	//Reset the state
	if(animation == ANIM_KNUXGETUP && animation_frame == image_number-1) state = ST_NORMAL;
}