function player_state_knuxfall(){
	//If state is not falling stop
	if(state != ST_KNUXFALL) 
	{
		exit;
	}
	
	//Change animations
	if(!ground)
	{
		animation_play(animator, ANIM_KNUXFALL);
	}
	
	//Play landing sound
	if(ground && animation_is_playing(animator, ANIM_KNUXFALL)) 
	{
		play_sound(sfx_land);
	}
	
	//Landed
	if(ground)
	{
		animation_play(animator, ANIM_KNUXLAND);
		ground_speed = 0;
	}
	
	//The end of animation
	if(animation_is_playing(animator, ANIM_KNUXLAND) && animation_has_finished(animator) && !landed) 
	{
		state = ST_NORMAL;
	}
}