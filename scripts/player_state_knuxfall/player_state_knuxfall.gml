function player_state_knuxfall(){
	//If state is not falling stop
	if(state != ST_KNUXFALL) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	
	//Change animations
	if(!ground)animation = ANIM_KNUXFALL;
	
	//Play landing sound
	if(landed) play_sound(sfx_land);
	
	//Landed
	if(ground)
	{
		animation = ANIM_KNUXLAND;
		ground_speed = 0;
	}
	
	//The end of animation
	if(animation == ANIM_KNUXLAND && animation_frame == image_number-1 && !landed) state = ST_NORMAL;
}