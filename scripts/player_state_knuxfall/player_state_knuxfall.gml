function player_state_knuxfall(){
	
	//Change animations
	if(!ground)
	{
		animation_play(animator, ANIM.KNUXFALL);
	}
	
	//Play landing sound
	if(ground && animation_is_playing(animator, ANIM.KNUXFALL)) 
	{
		play_sound(sfx_land);
	}
	
	//Landed
	if(ground)
	{
		animation_play(animator, ANIM.KNUXLAND);
		ground_speed = 0;
	}
	
	//The end of animation
	if(animation_is_playing(animator, ANIM.KNUXLAND) && animation_has_finished(animator) && !landed) 
	{
		state = player_state_normal;
	}
}